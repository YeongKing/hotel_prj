package kr.co.sist.elysian.admin.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("adminLoginController")
@RequestMapping("/admin")
public class LoginController {

	
	@GetMapping("/dashboard.do")
	public String login() {

		return "admin/dashboard/dashboard";

	}// main
	
	
	
}