package kr.co.sist.elysian.user.login.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.sist.elysian.user.login.model.domain.UserDomain;
import kr.co.sist.elysian.user.login.model.vo.UserVO;
import kr.co.sist.elysian.user.login.service.GoogleService;
import kr.co.sist.elysian.user.login.service.KakaoService;
import kr.co.sist.elysian.user.login.service.LoginService;

@Controller
@RequestMapping("/user")
public class SocialLoginController {
	
	@Autowired(required = false)
    private KakaoService ks;
	
	@Autowired(required = false)
    private GoogleService gs;

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
    
        
        System.out.println( "--kakaoLogin-----"+userInfo);
        // 사용자 정보를 확인하고 리다이렉트 URL을 반환
        HttpSession session = request.getSession();
        String redirectURL = ks.handleKakaoUserInfo(userInfo, session);
        
        return "redirect:" + redirectURL;
    }
    
    // 구글 로그인을 처리하는 메소드
    @GetMapping("/googleLogin.do")
    public String googleLogin(@RequestParam("code") String code, HttpServletRequest request) throws Exception {
        Map<String, Object> userInfo = gs.getGoogleUserInfo(code);
        HttpSession session = request.getSession();
        String redirectURL = gs.handleGoogleUserInfo(userInfo, session);
        return "redirect:" + redirectURL;
    }
    
    // 소셜 로그인을 통한 회원가입 페이지를 보여주는 메소드
    @GetMapping("/socialJoin.do")
    public String showSocialJoinPage(@RequestParam("userId") String userId, @RequestParam("email") String email, @RequestParam("loginMethod") String loginMethod, Model model) {
        String[] emailParts = email.split("@");
        model.addAttribute("userId", userId);
        model.addAttribute("email1", emailParts[0]);
        model.addAttribute("email2", emailParts[1]);
        model.addAttribute("loginMethod", loginMethod); // loginMethod 추가
        return "user/join/socialJoin";
    }
    
    // 회원가입 폼을 처리하는 메소드
    @PostMapping("/socialJoin.do")
    public String register(UserVO uVO, HttpServletRequest request) {
        String loginMethod = request.getParameter("loginMethod");
        uVO.setLoginMethod(loginMethod);  // 로그인 방법 설정
        
        if ("kakao".equals(loginMethod)) {
            ks.registerUser(uVO);
        } else if ("google".equals(loginMethod)) {
            gs.registerUser(uVO);
        }
        
        HttpSession session = request.getSession();
        session.setAttribute("userId", uVO.getUserId());
        return "redirect:/user/socialComplete.do";
    }
    
    // 회원가입 완료 페이지를 보여주는 메소드
    @GetMapping("/socialComplete.do")
    public String registerSuccess(HttpSession session, Model model) {
        String userId = (String) session.getAttribute("userId");
        model.addAttribute("userId", userId);
        return "user/join/socialComplete";
    }
    

}