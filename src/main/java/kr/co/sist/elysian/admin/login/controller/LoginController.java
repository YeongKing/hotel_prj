package kr.co.sist.elysian.admin.login.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.sist.elysian.admin.login.model.domain.AdminDomain;
import kr.co.sist.elysian.admin.login.model.vo.AdminVO;
import kr.co.sist.elysian.admin.login.service.LoginService;

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
	
	@Autowired(required = false)
	private LoginService ls;
	
	@PostMapping("/set_session.do")
	public String searchLogin(AdminVO aVO , Model model) {
		
		/*
		 * String id = httpServletRequest.getParameter("adminId"); String pw =
		 * httpServletRequest.getParameter("adminPw");
		 * 
		 * System.out.println(id); System.out.println(pw);
		 * 
		 * AdminVO aVO = new AdminVO(id, pw);
		 */
		
		System.out.println("aVO : " + aVO);
		
		AdminDomain adm = ls.searchLogin(aVO);
		
		
		if (adm != null) {
            model.addAttribute("adminId", adm.getAdminId());
            return "forward:dashboard.do";
        } else {
            model.addAttribute("error", "Invalid credentials");
            return "admin/login/login_frm";
        }
		 
	}
	
	@GetMapping("/remove_session.do")
	public String logout(SessionStatus ss) {
		ss.setComplete();
		return "redirect:adminlogin_frm.do";
	}
	
	
	
}
