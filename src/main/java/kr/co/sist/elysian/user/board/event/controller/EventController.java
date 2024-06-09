package kr.co.sist.elysian.user.board.event.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class EventController {
	
	@GetMapping("/userEvent.do")
	public String main() {
		System.out.println(1);
		return "user/board/event";
	}
}
