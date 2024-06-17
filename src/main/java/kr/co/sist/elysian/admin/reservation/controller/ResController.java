package kr.co.sist.elysian.admin.reservation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.sist.elysian.admin.reservation.model.domain.RoomResResponse;
import kr.co.sist.elysian.admin.reservation.model.vo.DiningResVO;
import kr.co.sist.elysian.admin.reservation.model.vo.RoomResVO;
import kr.co.sist.elysian.admin.reservation.service.ResService;

@Controller("adminResController")
@RequestMapping("/admin")
public class ResController {
	
	@Autowired(required = false)
	private ResService resService;
	
	@GetMapping("/roomResve.do")
	public String viewRoomResPage() {
		return "admin/resve/roomResve";
	}//searchRoomResList
	
	@ResponseBody
	@PostMapping(value="roomResList.do", produces="application/json; charset=UTF-8")
	public List<RoomResResponse> searchRoomResList() {
		List<RoomResResponse> data = resService.searchRoomResList();
		return data;
	}//searchRoomResList

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
	public String searchDiningResList(Model model) {
		return "admin/resve/diningResve";
	}//searchDiningResList
	
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