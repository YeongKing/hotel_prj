package kr.co.sist.elysian.user.login.controller;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.sist.elysian.user.login.model.domain.UserDomain;
import kr.co.sist.elysian.user.login.model.vo.UserVO;
import kr.co.sist.elysian.user.login.service.FindService;
import kr.co.sist.elysian.user.login.service.LoginService;

@SessionAttributes("userId")
@Controller("userLoginController")
@RequestMapping("/user")
public class LoginController {
    
    @Autowired(required = false)
    @Qualifier("userLoginService")
    private LoginService ls;
    
    @Autowired(required = false)
    private FindService findService;
    
    @GetMapping("/login.do") //로그인 버튼 클릭 시
    public String loginFrm() {
        return "user/login/loginForm"; //로그인 폼으로 이동
    } // loginFrm
    
    @GetMapping("/findIdentifyIntro.do")
    public String findIdentifyFrm() {
        return "user/identify/findIdentifyIntro";
    } // findIdentifyFrm

    @PostMapping("/set_session.do") //로그인 완료 시
    public String searchLogin(UserVO uVO, Model model, RedirectAttributes redirectAttributes) {
        // 암호화 객체 생성
        PasswordEncoder pe = new BCryptPasswordEncoder();
        
        UserDomain udm = ls.searchLogin(uVO);
        
        // 조회 결과가 없으면 등록된 회원이 아님
        if (udm == null) {
            redirectAttributes.addFlashAttribute("error", "등록된 회원이 아닙니다.");
            return "redirect:/user/login.do"; // 로그인 폼으로 리다이렉트
        }
        
        // 조회 결과가 있으면 비밀번호 비교
        String encryptedPassword = udm.getUserPw(); // DB에서 가져온 비밀번호
        
        String uncodePass = uVO.getUserPw();
        boolean matchFlag = pe.matches(uncodePass, encryptedPassword);
        
        if (matchFlag) {
            model.addAttribute("userId", udm.getUserId());
            model.addAttribute("userName", udm.getUserName());
            return "forward:index.do"; //메인 페이지로 이동
        } else {
            model.addAttribute("error", "잘못된 비밀번호 입니다.");
            return "user/login/loginForm"; //로그인 페이지로 이동
        }
    }
    
    @GetMapping("/logout.do")
    public String logout(SessionStatus ss) {
        ss.setComplete();
        return "user/login/logout_process"; // 메인 페이지로
    }

    ///////////아이디 비밀번호 찾기//////////
    
    /* 본인인증 팝업창 띄우기 */
    @GetMapping("/verify.do")
    public String verifyPopup() {
        return "user/identify/verification"; // identify/verification.jsp로 매핑됨
    }
    
    /* 본인인증 하기 */
    @GetMapping("/phoneCheck.do")
    @ResponseBody
    public String sendSMS(@RequestParam("phone") String userPhone) {
        System.out.println("Received phone number: " + userPhone);

        UserDomain user = findService.getUserDetails(userPhone);
        if (user != null) {
            return findService.sendSMS(userPhone);
        } else {
            return "error";
        }
    }
    
    @GetMapping("/getUserDetails.do")
    @ResponseBody
    public UserDomain getUserDetails(@RequestParam("phone") String userPhoneNumber) {
        return findService.getUserDetails(userPhoneNumber);  // 사용자 정보 가져오기 서비스 호출
    }

	@ResponseBody
	@PostMapping(value="/searchPopupLogin.do", produces="application/json; charset=UTF-8")
	public String searchPopupLogin(@ModelAttribute UserVO uVO,HttpSession session) {
	    JSONObject resultJson = new JSONObject();
	    // 암호화 객체 생성
	    PasswordEncoder pe = new BCryptPasswordEncoder();
	    
	    UserDomain udm = ls.searchLogin(uVO);
	    
	    if (udm != null) {
	        String encryptedPassword = udm.getUserPw(); // DB에서 가져온 비밀번호
	        String uncodePass = uVO.getUserPw();
	        boolean matchFlag = pe.matches(uncodePass, encryptedPassword);
	        
	        if (matchFlag) {
	            session.setAttribute("userId", udm.getUserId());
	            resultJson.put("result", "success");
	        } else {
	            resultJson.put("result", "fail");
	        }
	    } else {
	        resultJson.put("result", "fail");
	    }

	    
	    return resultJson.toJSONString();
	}//searchPopupLogin
    
    
    
    
    
    
    


}
