package kr.co.sist.elysian.admin.room.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("adminRoomController")
@RequestMapping("/admin")
public class RoomController {
	
	@GetMapping("/room.do")
	public String searchRoomList() {
		return "admin/room/room";
	} //searchRoomList

} // class