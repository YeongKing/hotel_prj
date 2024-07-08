package kr.co.sist.elysian.user.board.event.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sist.elysian.user.board.event.model.domain.EventDomain;
import kr.co.sist.elysian.user.board.event.service.EventService;
import kr.co.sist.elysian.user.home.model.HomeDomain;

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
	 * 이벤트 상세 정보를 가지고 이벤트 상세 화면으로 가는 메서드
	 * @param eventNum
	 * @param model
	 * @return
	 */
	@GetMapping("/eventDetail.do")
	public String goEventDetailPage(@RequestParam String eventNum,Model model) {
		EventDomain eDomain = null;
		List<EventDomain> eventList  = null;
		try {
			eventList = eventService.selectSugEvent();
			eDomain = eventService.searchEventDetail(eventNum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("eDomain", eDomain);
		model.addAttribute("eventList", eventList);

		return "user/board/eventDetail";
	}
	
	
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
            @RequestParam(defaultValue = "6") int size,
            @RequestParam String startDate,
            @RequestParam String endDate,
            @RequestParam String searchText){
		
		List<EventDomain> events = null;
		int totalCount = 0;
		if(startDate == "" || endDate == "") {
			events =	eventService.searchAllEventLists(page,size,searchText);
			totalCount = eventService.getTotalCount();
		}else {
			events =	eventService.searchKeywordEventLists(page,size,startDate,endDate,searchText);
			totalCount = eventService.getSearchTotalCount(startDate,endDate);	
		}
		System.out.println(events.toString());
		//리스트에 결과저장 (JSON형태)
		Map<String, Object>response = new HashMap<String, Object>();
		response.put("events", events);
		response.put("totalCount", totalCount);
		
		
		return response;
	}
	
	
 
} // class