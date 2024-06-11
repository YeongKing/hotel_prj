package kr.co.sist.elysian.user.board.info.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("userInfoController")
@RequestMapping("/user")
public class InfoController {
	
	@GetMapping("/aboutUs.do")
	public String aboutUs() {
		
		return "user/board/aboutUs";
		
	} // aboutUs

	@GetMapping("/location.do")
	public String location() {
		
		return "user/board/location";
		
	} // location

} // class