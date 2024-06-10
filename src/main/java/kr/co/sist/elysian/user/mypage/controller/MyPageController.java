package kr.co.sist.elysian.user.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("userMyPageController")
@RequestMapping("/user")
public class MyPageController {
	
	@GetMapping("/mypage.do")
	public String main() {
		
		return "user/mypage/main";
		
	} // main
	
	@GetMapping("/myInfoForm.do")
	public String detailUserInfo() {
		
		return "user/mypage/myInfoForm";
		
	} // detailUserInfo

	@GetMapping("/reserveList.do")
	public String searchRoomResList() {
		
		return "user/cnfirm/mber/room/reserveList";
		
	} // searchRoomResList

} // class