package kr.co.sist.elysian.user.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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

} // class