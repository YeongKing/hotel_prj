package kr.co.sist.elysian.user.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("userHomeController")
@RequestMapping("/user")
public class HomeController {
	
	@GetMapping("/index.do")
	public String main() {

		return "user/index";

	}// main
	
	
	
	
	
	

}
