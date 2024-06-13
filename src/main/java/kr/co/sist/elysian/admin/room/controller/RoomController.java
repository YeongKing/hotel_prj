package kr.co.sist.elysian.admin.room.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.sist.elysian.admin.room.model.domain.RoomListDomain;
import kr.co.sist.elysian.admin.room.model.vo.RoomVO;
import kr.co.sist.elysian.admin.room.service.RoomService;

@Controller("adminRoomController")
@RequestMapping("/admin")
public class RoomController {
	
	@Autowired(required = false)
	private RoomService rs;
	
	
	@GetMapping("/room.do")
	public String searchRoomList(Model model) {
		List<RoomListDomain> list = rs.searchRoomList();
		model.addAttribute("roomList",list);
		

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