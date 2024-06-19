package kr.co.sist.elysian.admin.board.event.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sist.elysian.admin.board.event.model.domain.EventDomain;
import kr.co.sist.elysian.admin.board.event.model.domain.EventListDomain;
import kr.co.sist.elysian.admin.board.event.model.vo.EventVO;
import kr.co.sist.elysian.admin.board.event.service.EventService;
import kr.co.sist.elysian.admin.member.model.domain.MemberDomain;

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
	
	
	@ResponseBody
	@PostMapping(value="/eventDetail.do", produces="application/json; charset=UTF-8")
	public EventDomain selectEvnetDetail(@RequestBody Map<String, Object> requestData, Model model) {
		 String eventNum = (String) requestData.get("eventNum");
	     EventDomain ed = es.searchEventDetail(eventNum);

		return ed;
	}//selectEvnetDetail
	

	
	
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