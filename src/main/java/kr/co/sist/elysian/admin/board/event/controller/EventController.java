package kr.co.sist.elysian.admin.board.event.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.sist.elysian.admin.board.event.model.vo.EventVO;

@Controller("adminEventController")
@RequestMapping("/admin")
public class EventController {
	
	@GetMapping("/event.do")
	public String searchEventList() {
		return "admin/board/event/event";
	}//searchEventList
	

	public String detailEventInfo(int eventNum, Model model) {
		return "";
	}//detailEventInfo
	
	
	public String addEvent(EventVO eVO) {
		return "";
	}//addEvent
	
	
	public String updateEvent(int eventNum , EventVO eVO , Model model) {
		return "";
	}//updateEvent
	
	
	public String deleteEvent(int eventNum ,Model model) {
		return "";
	}//deleteEvent
	
	
	
	
	
	

} // class