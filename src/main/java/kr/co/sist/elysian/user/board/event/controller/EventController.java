package kr.co.sist.elysian.user.board.event.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("userEventController")
@RequestMapping("/user")
public class EventController {
	
	@GetMapping("/event.do")
	public String searchAllEventList() {
		
		return "user/board/event";
	
	} // searchAllEventList

} // class