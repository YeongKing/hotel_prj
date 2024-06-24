package kr.co.sist.elysian.user.room.controller;


import java.net.http.HttpRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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


        System.out.println("rrVO :---------------"+rrVO);
		
		return "user/resve/room/step2";
		
	} // step2
	
	@PostMapping("/room3.do")
	public String step3(HttpSession session,HttpServletRequest request) {
		RoomResVO rrVO = (RoomResVO)session.getAttribute("rrVO");
		
		rrVO.setPayPrice(rrVO.getPayPrice() * rrVO.getNight());
		
		String guestRequest = request.getParameter("contArr");
		
		rrVO.setGuestRequest(guestRequest);
		
		
        
        
        session.setAttribute("rrVO", rrVO);


        System.out.println("rrVO :---------------"+rrVO);
		
		return "user/resve/room/step3";
		
	} // step2	
	
	
	
	
	
	
	
	
	
} // class