package kr.co.sist.elysian.admin.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

@SessionAttributes("admin_id")
@Controller("adminLoginController")
@RequestMapping("/admin")
public class LoginController {

	
	
	@GetMapping("/login_frm.do")
	public String main() {

		return "admin/login/login_frm";

	}// main
	
	

	@GetMapping("/dashboard.do")
	public String dashboard() {

		return "admin/dashboard/dashboard";

	}// login
	
	@GetMapping("/set_session.do")
	public String loginProcess(Model model) {
		model.addAttribute("admin_id", "admin");
		return "forward:dashboard.do";
	}
	
	@GetMapping("/remove_session.do")
	public String logout(SessionStatus ss) {
		ss.setComplete();
		return "redirect:adminlogin_frm.do";
	}
	
	
	
}
