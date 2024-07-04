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

import kr.co.sist.elysian.user.home.model.HomeDomain;
import kr.co.sist.elysian.user.room.model.domain.MemberDomain;
import kr.co.sist.elysian.user.room.model.domain.RoomDomain;
import kr.co.sist.elysian.user.room.model.domain.RoomListDomain;
import kr.co.sist.elysian.user.room.model.vo.RoomResVO;
import kr.co.sist.elysian.user.room.service.RoomService;

@Controller("userRoomController")
@RequestMapping("/user")
public class RoomController {

	@Autowired(required = false)
	@Qualifier("userRoomService")
	private RoomService rs;



	/**
	 * 페이지 이동 메서드
	 * @return
	 */
	@GetMapping("/room0.do")
	public String step0() {

		return "user/resve/room/step0";

	} // step0


	/**
	 * 페이지 이동 메서드
	 * @param rrVO 객실예약VO
	 * @param model
	 * @param session
	 * @return
	 */
	@PostMapping("/room1.do")
	public String step1(@ModelAttribute RoomResVO rrVO, Model model, HttpSession session) {

		session.setAttribute("rrVO", rrVO);

		List<RoomListDomain> list = rs.searchRoomList(rrVO);

		model.addAttribute("roomList",list);

		return "user/resve/room/step1";

	} // step1



	/** 
	 * 페이지 이동 메서드
	 * @param rrVO 객실예약VO
	 * @param session
	 * @return
	 */
	@PostMapping("/room2.do")
	public String step2(@ModelAttribute RoomResVO rrVO,HttpSession session) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		String currentDate = sdf.format(new Date());
		session.setAttribute("currentDate", currentDate);
		session.setAttribute("rrVO", rrVO);



		return "user/resve/room/step2";

	} // step2




	/**
	 * 페이지 이동 메서드
	 * @param session
	 * @param request
	 * @param umd 멤버 도메인
	 * @return
	 */
	@PostMapping("/room3.do")
	public String step3(HttpSession session,HttpServletRequest request,MemberDomain umd) {
		RoomResVO rrVO = (RoomResVO)session.getAttribute("rrVO");

		String guestRequest = request.getParameter("contArr");

		rrVO.setGuestRequest(guestRequest);

		String userId = session.getAttribute("userId").toString();

		umd = rs.searchMember(userId); 

		rrVO.setUserId(umd.getMemberId());

		session.setAttribute("umd", umd);
		session.setAttribute("rrVO", rrVO);




		return "user/resve/room/step3";

	} // step3






	/**
	 * 예약객실 검증 메서드
	 * @param session 
	 * @param model
	 * @return 객실번호
	 */
	@ResponseBody
	@PostMapping(value="/resveValid.do", produces="application/json; charset=UTF-8")
	public int resveValid(HttpSession session) {
		RoomResVO rrVO = (RoomResVO)session.getAttribute("rrVO");


		int roomId = rs.resveValid(rrVO);

		rrVO.setRoomId(roomId);
		session.setAttribute("rrVO", rrVO);

		return roomId;
	}//resveValid







	/**
	 * 객실예약 등록 메서드
	 * @param requestData
	 * @param session
	 * @return
	 */
	@ResponseBody
	@PostMapping(value="/insertRoomRes.do", produces="application/json; charset=UTF-8")
	public boolean insertRoomRes(@RequestBody Map<String, Object> requestData,HttpSession session) {
		RoomResVO rrVO = (RoomResVO)session.getAttribute("rrVO");

		String payNum = requestData.get("payNum").toString();
		String roomResStatus = requestData.get("roomResStatus").toString();
		String guestEmail = requestData.get("guestEmail").toString();
		String guestPhone = requestData.get("guestPhone").toString();
		String guestBirthday = requestData.get("guestBirthday").toString();




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






	/** 페이지 이동 메서드
	 * @return
	 */
	@PostMapping("/room4.do")
	public String step4(Model model) {
		
		

		
		List<RoomDomain> roomEventList = rs.selectRoomEvent();
		model.addAttribute("roomEventlist", roomEventList);
		
		
		

		return "user/resve/room/step4";
		

		

	} // step4		



























} // class