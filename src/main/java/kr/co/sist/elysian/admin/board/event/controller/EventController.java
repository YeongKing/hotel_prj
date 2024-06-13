package kr.co.sist.elysian.admin.board.event.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.sist.elysian.admin.board.event.model.domain.EventListDomain;
import kr.co.sist.elysian.admin.board.event.model.vo.EventVO;
import kr.co.sist.elysian.admin.board.event.repository.EventDAO;
import kr.co.sist.elysian.admin.board.event.service.EventService;

@Controller("adminEventController")
@RequestMapping("/admin")
public class EventController {
	
	@Autowired(required = false)
	private EventService es;
	
	@GetMapping("/event.do")
	public String searchEventList(Model model) {
		List<EventListDomain> list = es.searchEventList();
		model.addAttribute("eventList",list);
		

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