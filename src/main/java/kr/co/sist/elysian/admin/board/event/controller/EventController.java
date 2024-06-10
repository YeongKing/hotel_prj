package kr.co.sist.elysian.admin.board.event.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("adminEventController")
@RequestMapping("/admin")
public class EventController {
	
	@GetMapping("/event.do")
	public String searchEventList() {
		return "admin/board/event/event";
	} //searchEventList
	


} // class