package kr.co.sist.elysian.admin.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("adminResController")
@RequestMapping("/admin")
public class ResController {
	
	@GetMapping("/roomResve.do")
	public String searchRoomResList() {
		return "admin/resve/roomResve";
	} // mappingRoomResve
	
	@GetMapping("/diningResve.do")
	public String searchDiningResList() {
		return "admin/resve/diningResve";
	} // mappingDiningResve

} // class