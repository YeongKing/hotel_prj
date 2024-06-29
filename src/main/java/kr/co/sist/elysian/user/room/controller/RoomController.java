package kr.co.sist.elysian.user.room.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sist.elysian.user.room.model.domain.MemberDomain;
import kr.co.sist.elysian.user.room.model.domain.RoomListDomain;
import kr.co.sist.elysian.user.room.model.vo.RoomResVO;
import kr.co.sist.elysian.user.room.service.RoomService;

@Controller("userRoomController")
@RequestMapping("/user")
public class RoomController {

	@Autowired(required = false)
	@Qualifier("userRoomService")
	private RoomService rs;
	
	
	
	@GetMapping("/room0.do")
	public String step0() {
		
		return "user/resve/room/step0";
		
	} // step0
	
	
	@PostMapping("/room1.do")
	public String step1(@ModelAttribute RoomResVO rrVO, Model model, HttpSession session) {
		
		session.setAttribute("rrVO", rrVO);
		
		
		List<RoomListDomain> list = rs.searchRoomList(rrVO);
		/*
		 * System.out.println("rrVO :---------------"+rrVO);
		  System.out.println("list :---------------"+list); */
		
		model.addAttribute("roomList",list);
		
		return "user/resve/room/step1";
		
	} // step1
	
	
	@PostMapping("/room2.do")
	public String step2(@ModelAttribute RoomResVO rrVO,HttpSession session) {
		
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
        String currentDate = sdf.format(new Date());
        session.setAttribute("currentDate", currentDate);
        session.setAttribute("rrVO", rrVO);


//        System.out.println("rrVO :---------------"+rrVO);
		
		return "user/resve/room/step2";
		
	} // step2
	
	@PostMapping("/room3.do")
	public String step3(HttpSession session,HttpServletRequest request,MemberDomain umd) {
		RoomResVO rrVO = (RoomResVO)session.getAttribute("rrVO");
		
		String guestRequest = request.getParameter("contArr");
		
		rrVO.setGuestRequest(guestRequest);

		
		String userIdSession = (String)session.getAttribute("userId");
		
		if(userIdSession == null) {
			
			
			///임시 세션설정//
			session.setAttribute("userId", "dndcks1004");
			
			
			
		}
		

		
		 String userId = session.getAttribute("userId").toString();
		
		umd = rs.searchMember(userId); 
		
		
		
		///////////////////////////////////////////////
		//일단 로그인 성공했다는 가정하에
		
		rrVO.setUserId(umd.getMemberId());
		
//		System.out.println("umd ----------------" + umd);
		
		
		
		///////////////////////////////////////////////
        
        session.setAttribute("umd", umd);
        session.setAttribute("rrVO", rrVO);


//        System.out.println("rrVO :---------------"+rrVO);
		
		return "user/resve/room/step3";
		
	} // step3
	
	
	
	

	
	@ResponseBody
	@PostMapping(value="/resveValid.do", produces="application/json; charset=UTF-8")
	public int resveValid(HttpSession session, Model model) {
		RoomResVO rrVO = (RoomResVO)session.getAttribute("rrVO");
		
		
		int roomId = rs.resveValid(rrVO);

		rrVO.setRoomId(roomId);
		session.setAttribute("rrVO", rrVO);

	
		
		
	     
		return roomId;
	}//resveValid
	
	
	
	
	
	@ResponseBody
	@PostMapping(value="/insertRoomRes.do", produces="application/json; charset=UTF-8")
	public boolean insertRoomRes(@RequestBody Map<String, Object> requestData,HttpSession session) {
		RoomResVO rrVO = (RoomResVO)session.getAttribute("rrVO");
		
		String payNum = requestData.get("payNum").toString();
		String roomResStatus = requestData.get("roomResStatus").toString();
		String guestEmail = requestData.get("guestEmail").toString();
		String guestPhone = requestData.get("guestPhone").toString();
		String guestBirthday = requestData.get("guestBirthday").toString();

		
		
//		ckinDate = ckinDate.replace('.', '-');
//		ckoutDate = ckoutDate.replace('.', '-');
		
		
		
		
		int roomId = Integer.parseInt(requestData.get("roomId").toString());
		
		rrVO.setPayNum(payNum);
		rrVO.setRoomResStatus(roomResStatus);
		rrVO.setGuestEmail(guestEmail);
		rrVO.setGuestPhone(guestPhone);
		rrVO.setGuestBirthday(guestBirthday);
		rrVO.setRoomId(roomId);
		
		System.out.println(rrVO);
		
		
		 boolean result = rs.insertRoomRes(rrVO); 


		 session.setAttribute("rrVO", rrVO); 

	
		return result;
	}//insertRoomRes
	
	
	
	
	
	@PostMapping("/room4.do")
	public String step4() {

		

		return "user/resve/room/step4";
		
	} // step4		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
} // class