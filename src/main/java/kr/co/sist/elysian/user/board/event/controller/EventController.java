package kr.co.sist.elysian.user.board.event.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sist.elysian.user.board.event.model.domain.EventDomain;
import kr.co.sist.elysian.user.board.event.service.EventService;

@Controller("userEventController")
@RequestMapping("/user")
public class EventController {
	
	@Autowired(required = false)
	private EventService eventService;
	
	/**
	 * 이벤트리스트 화면으로 가는 메서드
	 * @return
	 */
	@GetMapping("/event.do")
	public String searchEventPage() {
		
		return "user/board/event";
	
	} // searchAllEventList
	
	
	/**
	 * 이벤트리스트를 가져오는 메서드
	 * @param page
	 * @param size
	 * @return
	 */
	@ResponseBody
	@GetMapping("/eventList.do")
	public Map<String, Object> searchEventLists(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "6") int size){
		
		List<EventDomain> events =	eventService.searchAllEventLists(page,size);
		int totalCount = eventService.getTotalCount();
		
		Map<String, Object>response = new HashMap<String, Object>();
		response.put("events", events);
		response.put("totalCount", totalCount);
		System.out.println(events);
		return response;
	}
 
} // class