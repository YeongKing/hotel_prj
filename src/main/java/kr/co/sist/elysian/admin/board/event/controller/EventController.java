package kr.co.sist.elysian.admin.board.event.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.sist.elysian.admin.board.event.model.domain.EventDomain;
import kr.co.sist.elysian.admin.board.event.model.domain.EventListDomain;
import kr.co.sist.elysian.admin.board.event.model.vo.EventVO;
import kr.co.sist.elysian.admin.board.event.service.EventService;

@Controller("adminEventController")
@RequestMapping("/admin")
public class EventController {
	
	@Autowired(required = false)
	private EventService es;
	
	//이벤트 목록 조회메서드
	@GetMapping("/event.do")
	public String searchEventList(Model model) {
		List<EventListDomain> list = es.searchEventList();
		model.addAttribute("eventList",list);
		

		return "admin/board/event/event";
	}//searchEventList
	
	
	//이벤트 상세 조회 메서드
	@ResponseBody
	@PostMapping(value="/eventDetail.do", produces="application/json; charset=UTF-8")
	public EventDomain selectEvnetDetail(@RequestBody Map<String, Object> requestData, Model model) {
		 String eventNum = (String) requestData.get("eventNum");
	     EventDomain ed = es.searchEventDetail(eventNum);

		return ed;
	}//selectEvnetDetail
	
	//이벤트 마지막번호 + 1 메서드
	@ResponseBody
	@GetMapping("/addEventModal.do")
	public String selectLastDiningNum() {
		String nextEventNum = es.searchLastEventNum();
		return nextEventNum;
	}//selectLastDiningNum
	
	
	//이벤트 등록 메서드
	@PostMapping("/addEvent.do")
	@ResponseBody
	public boolean addEvent(EventVO eVO,HttpServletRequest request) throws IOException {
	    File uploadRepository = new File("C:/dev/workspace/hotel_prj/src/main/webapp/util/event_img");
	    //경로가 없을 시 예외를 던진다.
	    if (!uploadRepository.exists()) {
	    	throw new IOException("찾을수 없는 경로입니다");
	    }
	    
	    int maxSize= 100*1024*1024;
	    MultipartRequest mr=new MultipartRequest(request,uploadRepository.getAbsolutePath(), maxSize, "UTF-8",new DefaultFileRenamePolicy());
	    String mainImg = mr.getFilesystemName("eventMainImg");
	    String subImg = mr.getFilesystemName("eventSubImg");
	    System.out.println(mr.getParameter("eventNum"));
	    eVO = EventVO.builder()
			    .eventNum(mr.getParameter("eventNum"))
			    .adminId(mr.getParameter("adminId"))
			    .eventTitle(mr.getParameter("eventTitle"))
			    .eventSubTitle(mr.getParameter("eventSubTitle"))
			    .eventStartDate(mr.getParameter("eventStartDate"))
			    .eventEndDate(mr.getParameter("eventEndDate"))
			    .eventMainImg(mainImg)
			    .eventSubImg(subImg)
			    .eventContent(mr.getParameter("eventContent"))
			    .build();
	    File tempFile = new File(uploadRepository.getAbsolutePath()+"/"+ mainImg);
	    File subFile = new File(uploadRepository.getAbsolutePath()+"/"+ subImg);
  
	    if(tempFile.length() > maxSize) { //업로드 제한
			tempFile.delete();
		}
	    if(subFile.length() > maxSize) { //업로드 제한
	    	subFile.delete();
		}
	    
	    boolean isInserted = es.registerEvent(eVO);
		
		return isInserted;
	}//addEvent
	
	@ResponseBody
	@PostMapping("/updateEvent.do")
	public boolean updateEvent(EventVO eVO ,HttpServletRequest request) throws IOException {
		File uploadRepository = new File("C:/dev/workspace/hotel_prj/src/main/webapp/util/event_img");
		//경로가 없을 시 예외를 던진다.
	    if (!uploadRepository.exists()) {
	    	throw new IOException("찾을수 없는 경로입니다");
	    }
	    
	    int maxSize= 100*1024*1024;
	    MultipartRequest mr=new MultipartRequest(request,uploadRepository.getAbsolutePath(), maxSize, "UTF-8",new DefaultFileRenamePolicy());
	    
	    String mainImg = mr.getFilesystemName("eventMainImg");
	    String subImg = mr.getFilesystemName("eventSubImg");
		
	    String existingMainImg = mr.getParameter("existMainImg");
	    String existingSubImg = mr.getParameter("existSubImg");
		
	    //새로 등록한 이미지가 없을경우 본래 이미지로 대체
		if(mainImg == null && existingMainImg != null) {
			 mainImg = existingMainImg;
		 }
		if(mainImg == null && existingSubImg != null) {
			 mainImg = existingSubImg;
		 }
		
	    eVO = EventVO.builder()
			    .eventNum(mr.getParameter("eventNum"))
			    .adminId(mr.getParameter("adminId"))
			    .eventTitle(mr.getParameter("eventTitle"))
			    .eventSubTitle(mr.getParameter("eventSubTitle"))
			    .eventStartDate(mr.getParameter("eventStartDate"))
			    .eventEndDate(mr.getParameter("eventEndDate"))
			    .eventMainImg(mainImg)
			    .eventSubImg(subImg)
			    .eventContent(mr.getParameter("eventContent"))
			    .build();
	    File tempFile = new File(uploadRepository.getAbsolutePath()+"/"+ mainImg);
	    File subFile = new File(uploadRepository.getAbsolutePath()+"/"+ subImg);
  
	    if(tempFile.length() > maxSize) { //업로드 제한
			tempFile.delete();
		}
	    if(subFile.length() > maxSize) { //업로드 제한
	    	subFile.delete();
		}
	    //HashMap에 아이디와, VO 담기
		HashMap< String, Object> param = new HashMap<String, Object>();
		param.put("eventNum", mr.getParameter("eventNum"));
		param.put("eVO", eVO);
	    boolean isUpdated = es.modifyEvent(param);
		
		return isUpdated;
	}//updateEvent
	

	
	
	
	
	
	

} // class