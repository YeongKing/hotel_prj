package kr.co.sist.elysian.user.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
@Controller("userHomeController")
@RequestMapping("/user")
public class HomeController {
	
	@RequestMapping(value="/index.do",method= {GET,POST})
	public String main() {

		return "user/index";

	}// main

} // class