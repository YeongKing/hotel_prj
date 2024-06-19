package kr.co.sist.elysian.user.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.sist.elysian.admin.login.model.domain.AdminDomain;
import kr.co.sist.elysian.admin.login.model.vo.AdminVO;
import kr.co.sist.elysian.user.login.model.domain.UserDomain;
import kr.co.sist.elysian.user.login.model.vo.UserVO;
import kr.co.sist.elysian.user.login.service.LoginService;


@Controller("userLoginController")
@RequestMapping("/user")
public class LoginController {
	
	@GetMapping("/login.do")
	public String loginFrm() {
		
		return "user/login/loginForm";
		
	} // loginFrm
	
	@GetMapping("/findIdentifyIntro.do")
	public String findIdentifyFrm() {
		
		return "user/identify/findIdentifyIntro";
		
	} // findIdentifyFrm
	
	@Autowired(required = false)
	private LoginService ls;

	@PostMapping("/set_session.do")
	public String searchLogin(UserVO uVO, Model model) {
	    // 암호화 객체 생성
	    PasswordEncoder pe = new BCryptPasswordEncoder();
	    
	    UserDomain udm = ls.searchLogin(uVO);
	    
	    // 조회 결과가 없으면 등록된 관리자가 아님
	    if (udm == null) {
	        model.addAttribute("error", "등록된 관리자가 아닙니다.");
	        return "admin/login/login_frm";
	    }
	    
	    // 조회 결과가 있으면 비밀번호 비교
	    String encryptedPassword = udm.getUserPw(); // DB에서 가져온 비밀번호
	    System.out.println("DB에 저장된 비밀번호: " + encryptedPassword);
	    
	    String uncodePass = uVO.getUserPw();
	    boolean matchFlag = pe.matches(uncodePass, encryptedPassword);
	    System.out.println("비밀번호 일치 여부: " + matchFlag);
	    
	    if (matchFlag) {
	        model.addAttribute("userId", udm.getUserId());
	        model.addAttribute("userName", udm.getUserName());
	        return "forward:index.do";
	    } else {
	        model.addAttribute("error", "잘못된 비밀번호 입니다.");
	        return "user/login/login_frm";
	    }
	}
	
	public String logout(SessionStatus ss) {
		ss.setComplete();
		return "forward:index.do";
	}

} // class