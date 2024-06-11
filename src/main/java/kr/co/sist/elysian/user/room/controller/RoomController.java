package kr.co.sist.elysian.user.room.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("userRoomController")
@RequestMapping("/user")
public class RoomController {

	@GetMapping("/room.do")
	public String step0() {
		
		return "user/resve/room/step0";
		
	} // step0
	
} // class