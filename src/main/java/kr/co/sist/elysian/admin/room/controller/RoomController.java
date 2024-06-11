package kr.co.sist.elysian.admin.room.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.sist.elysian.admin.room.model.vo.RoomVO;

@Controller("adminRoomController")
@RequestMapping("/admin")
public class RoomController {
	
	@GetMapping("/room.do")
	public String searchRoomList() {
		return "admin/room/room";
	}//searchRoomList

	
	
	public String addFrm() {
		return "";
	}//addFrm
	
	
	public String frmProcess(RoomVO rVO) {
		return "";
	}//frmProcess
	
	
	public String detailRoom(int roomId, Model model) {
		return "";
	}//detailRoom
	
	
	public String modifyRoom(RoomVO rVO, Model model) {
		return "";
	}//modifyRoom
	
	
	public String removeRoom(int roomId, Model model) {
		return "";
	}//removeRoom
	
	
	public String logout(SessionStatus ss) {
		return "";
	}//logout
	
	
	
	
	
	
} // class