package kr.co.sist.elysian.user.join.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("userJoinController")
@RequestMapping("/user")
public class JoinController {
	
	@GetMapping("/join.do")
	public String joinFrm() {
		
		return "user/join/joinIntro";
		
	} // joinFrm

} // class