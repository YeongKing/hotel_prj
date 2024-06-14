package kr.co.sist.elysian.admin.login.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
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

@SessionAttributes("adminId")
@Controller("adminLoginController")
@RequestMapping("/admin")
public class LoginController {

	
	
	@GetMapping("/login_frm.do")
	public String main(Model model) {

		System.out.println("----adminId session : "+ model.getAttribute("adminId"));
		return "admin/login/login_frm";

	}// main
	
	

//	@GetMapping("/dashboard.do")
	@RequestMapping(value="/dashboard.do",method= {GET,POST})
	public String dashboard() {

		return "admin/dashboard/dashboard";

	}// login
	
	@Autowired(required = false)
	private LoginService ls;
	
	@PostMapping("/set_session.do")
	public String searchLogin(AdminVO aVO , Model model) {
		
		/*
		 * String id = httpServletRequest.getParameter("adminId"); 
		 * String pw =
		 * httpServletRequest.getParameter("adminPw");
		 * 
		 * System.out.println(id); System.out.println(pw);
		 * 
		 * AdminVO aVO = new AdminVO(id, pw);
		 */
		
//		System.out.println("aVO : " + aVO);
		//암호화 객체 생성
		PasswordEncoder pe = new BCryptPasswordEncoder();
		
		boolean flag=false;
		AdminDomain adm = ls.searchLogin(aVO);
		
		flag = adm!= null; //조회결과가 있으면 true,  false
		
		String encryptedPassword = "";
		
		// 입력한 비밀번호와 암호화된 비밀번호 비교
//		if( flag ) {
//			encryptedPassword=adm.getAdminPw();
//			System.out.println( aVO.getAdminPw()+" /" + encryptedPassword );
//			flag = pe.matches(aVO.getAdminPw(), encryptedPassword);
//			System.out.println("------------------"+flag);
//		}
		
		if ( flag ) {
//			model.addAttribute("adminId", "test"); //get방식 test용 코드
//			model.addAttribute("adminAuthority", adm.getAdminAuthority()); //get방식 test용 코드
			encryptedPassword=adm.getAdminPw();
			flag = pe.matches(aVO.getAdminPw(), encryptedPassword);
            model.addAttribute("adminId", adm.getAdminId());
            model.addAttribute("adminAuthority", adm.getAdminAuthority());
            return "forward:dashboard.do";
        } else {
            model.addAttribute("error", "Invalid credentials");
            return "admin/login/login_frm";
        }
		
//		return "forward:dashboard.do"; //get방식 test용 코드
		 
	}
	
	@GetMapping("/logout.do")
	public String logout(SessionStatus ss) {
		ss.setComplete();
		return "admin/login/logout";
	}
	
	
	
}
