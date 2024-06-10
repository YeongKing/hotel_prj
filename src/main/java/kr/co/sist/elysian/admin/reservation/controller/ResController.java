package kr.co.sist.elysian.admin.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.sist.elysian.admin.reservation.model.vo.DiningResVO;
import kr.co.sist.elysian.admin.reservation.model.vo.RoomResVO;

@Controller("adminResController")
@RequestMapping("/admin")
public class ResController {
	
	@GetMapping("/roomResve.do")
	public String searchRoomResList() {
		return "admin/resve/roomResve";
	}//mappingRoomResve
	

	public String detailRoomRes(String roomId , Model model) {
		return "";
	}//detailRoomRes
	
	
	public String modifyRoomRes(RoomResVO rrVO, Model model) {
		return "";
	}//modifyRoomRes
	
	
	public String removeRoomRes(String roomId , Model model) {
		return "";
	}//removeRoomRes
	
	
	
	
	
	
	@GetMapping("/diningResve.do")
	public String searchDiningResList() {
		return "admin/resve/diningResve";
	}//mappingDiningResve
	
	
	public String detailDiningRes(String diningId , Model model) {
		return "";
	}//detailDiningRes
	
	
	public String modifyDiningRes(DiningResVO drVO, Model model) {
		return "";
	}//modifyDiningRes
	
	
	public String removeDiningRes(String diningId , Model model) {
		return "";
	}//removeDiningRes
	
	
	
	
	public String logout(SessionStatus ss) {
		return "";
	}//logout
	
	
	

} // class