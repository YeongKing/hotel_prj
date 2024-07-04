package kr.co.sist.elysian.admin.login.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.nio.file.spi.FileSystemProvider;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
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

		return "admin/login/login_frm";

	}// main
	
	

//	@GetMapping("/dashboard.do")
	@RequestMapping(value="/dashboard.do",method= {GET,POST})
	public String dashboard() {

		return "admin/dashboard/dashboard";

	}// login
	
	@Autowired(required = false)
	@Qualifier("adminLoginService")
	private LoginService ls;
	
	@PostMapping("/set_session.do")
	public String searchLogin(AdminVO aVO, Model model, HttpSession session) {
	    // 암호화 객체 생성
	    PasswordEncoder pe = new BCryptPasswordEncoder();
	    
	    AdminDomain adm = ls.searchLogin(aVO);
	    
	    // 조회 결과가 없으면 등록된 관리자가 아님
	    if (adm == null) {
	        model.addAttribute("error", "등록된 관리자가 아닙니다.");
	        return "admin/login/login_frm";
	    }
	    
	    // 조회 결과가 있으면 비밀번호 비교
	    String encryptedPassword = adm.getAdminPw(); // DB에서 가져온 비밀번호
	    
	    String uncodePass = aVO.getAdminPw();
	    boolean matchFlag = pe.matches(uncodePass, encryptedPassword);
	    
	    if (matchFlag) {
	        model.addAttribute("adminId", adm.getAdminId());
	        model.addAttribute("adminAuthority", adm.getAdminAuthority());
	        session.setAttribute("adminAuthority", adm.getAdminAuthority());
	        return "forward:dashboard.do";
	    } else {
	        model.addAttribute("error", "잘못된 비밀번호 입니다.");
	        return "admin/login/login_frm";
	    }
	}
	
	@GetMapping("/logout.do")
	public String logout(SessionStatus ss) {
		ss.setComplete();
		return "admin/login/logout";
	}
	
	
	
}
