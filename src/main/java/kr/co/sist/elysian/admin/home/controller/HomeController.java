package kr.co.sist.elysian.admin.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("adminHomeController")
@RequestMapping("/admin")
public class HomeController {
	
	@GetMapping("/index.do")
	public String main() {

		return "admin/index";// view페이지 명 WEB-INF/views/index.jsp를 찾는다.

	}// main
	
	
	
	
	
	

}
