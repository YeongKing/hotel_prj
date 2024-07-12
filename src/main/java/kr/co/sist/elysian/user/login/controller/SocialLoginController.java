package kr.co.sist.elysian.user.login.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.sist.elysian.user.login.model.domain.UserDomain;
import kr.co.sist.elysian.user.login.model.vo.UserVO;
import kr.co.sist.elysian.user.login.service.GoogleService;
import kr.co.sist.elysian.user.login.service.KakaoService;
import kr.co.sist.elysian.user.login.service.LoginService;
import kr.co.sist.elysian.user.login.service.NaverService;

@Controller
@RequestMapping("/user")
public class SocialLoginController {
	
	@Autowired(required = false)
    private KakaoService ks;
	
	@Autowired(required = false)
    private GoogleService gs;
	
	@Autowired(required = false)
	private NaverService ns;
	
    @Autowired
    private LoginService ls;
	
	/**
     * 카카오 로그인 콜백을 처리하는 메소드
     * @param code 카카오에서 받은 인가 코드
     * @param request HttpServletRequest 객체
     * @return 회원가입 페이지로 리다이렉트
     * @throws Exception 액세스 토큰이나 사용자 정보를 가져오는 중 예외 발생 시
     */
    @GetMapping("/kakaoLogin.do")
    public String kakaoLogin(@RequestParam("code") String code, HttpServletRequest request) throws Exception {
        // 카카오로부터 액세스 토큰을 받아옴
        String accessToken = ks.getKaKaoAccessToken(code);
        // 액세스 토큰을 사용하여 사용자 정보를 받아옴
        Map<String, Object> userInfo = ks.getKaKaoUserInfo(accessToken);

        System.out.println("--kakaoLogin-----" + userInfo);
        // 사용자 정보를 확인하고 리다이렉트 URL을 반환
        HttpSession session = request.getSession();
        String redirectURL = ks.handleKakaoUserInfo(userInfo, session, "KAKAO");

        return "redirect:" + redirectURL;
    }
    
    // 구글 로그인을 처리하는 메소드
    @GetMapping("/googleLogin.do")
    public String googleLogin(@RequestParam("code") String code, HttpServletRequest request) throws Exception {
        Map<String, Object> userInfo = gs.getGoogleUserInfo(code);
        HttpSession session = request.getSession();
        String redirectURL = gs.handleGoogleUserInfo(userInfo, session, "GOOGLE");
        return "redirect:" + redirectURL;
    }
    
    // 네이버 로그인을 처리하는 메소드
    @GetMapping("/naverLogin.do")
    public String naverLogin(@RequestParam("code") String code, HttpSession session) throws Exception {
        String accessToken = ns.getNaverAccessToken(code);
        Map<String, Object> userInfo = ns.getNaverUserInfo(accessToken);

        String redirectURL = ns.handleNaverUserInfo(userInfo, session, "NAVER");

        return "redirect:" + redirectURL;
    }
    
    // 소셜 로그인 연동 페이지를 보여주는 메소드
    @GetMapping("/socialJoin.do")
    public String showSocialJoinPage(@RequestParam("socialId") String socialId, @RequestParam("loginMethod") String loginMethod, Model model) {
        model.addAttribute("socialId", socialId);
        model.addAttribute("loginMethod", loginMethod); // loginMethod 추가
        return "user/join/socialConnectForm";
    }
    
    // 소셜 로그인 연동을 진하는 메소드
    @PostMapping("/socialConnect.do")
    public ResponseEntity<Map<String, Object>> socialConnect(@RequestBody Map<String, String> params, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        try {
            String userId = params.get("userId");
            String userPw = params.get("userPw");
            String socialId = params.get("socialId");
            String loginMethod = params.get("loginMethod");

            UserVO userVO = new UserVO();
            userVO.setUserId(userId);
            userVO.setUserPw(userPw);
            userVO.setLoginMethod(loginMethod);

            UserDomain user = ls.searchLogin(userVO);

            if (user != null) {
                String encryptedPassword = user.getUserPw();
                System.out.println("Input Password: " + userPw);
                System.out.println("Encrypted Password from DB: " + encryptedPassword);

                boolean matchFlag = ls.checkPassword(userPw, encryptedPassword);
                System.out.println(matchFlag);
                
                if (matchFlag) {
                    userVO.setSocialId(socialId);
                    userVO.setLoginMethod(loginMethod);

                    int result = ls.updateSocialId(userVO);

                    if (result > 0) {
                        session.setAttribute("userId", userId);
                        ls.updateSocialLoginDate(userVO);
                        response.put("success", true);
                        response.put("message", "소셜 아이디 연동에 성공했습니다.");
                    } else {
                        response.put("success", false);
                        response.put("message", "소셜 아이디 연동에 실패했습니다.");
                    }
                } else {
                    response.put("success", false);
                    response.put("message", "아이디 또는 비밀번호가 올바르지 않습니다.");
                }
            } else {
                response.put("success", false);
                response.put("message", "사용자를 찾을 수 없습니다.");
            }
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "오류가 발생했습니다. 관리자에게 문의하세요.");
        }
        return ResponseEntity.ok(response);
    }
}