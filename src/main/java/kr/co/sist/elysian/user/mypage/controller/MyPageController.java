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

	@GetMapping("/roomResList.do")
	public String searchRoomResList() {
		
		return "user/cnfirm/mber/room/reserveList";
		
	} // searchRoomResList
	
	@GetMapping("/roomResView.do")
	public String detailRoomRes() {
		
		return "user/cnfirm/mber/room/reserveView";
		
	} // detailRoomRes
	
	@GetMapping("/diningResList.do")
	public String searchDiningResList() {
		
		return "user/cnfirm/mber/dining/reserveList";
		
	} // searchDiningResList

	@GetMapping("/diningResView.do")
	public String detailDiningRes() {
		
		return "user/cnfirm/mber/dining/reserveView";
		
	} // detailDiningRes
	
	@GetMapping("/infoUpdateForm.do")
	public String updateVisitorInfo() {
		
		return "user/cnfirm/mber/dining/infoUpdateForm";
		
	} // updateVisitorInfo

	@GetMapping("/myInfoForm.do")
	public String detailUserInfo() {
		
		return "user/mypage/myInfoForm";
		
	} // detailUserInfo

	@GetMapping("/pwChngForm.do")
	public String modifyPw() {
		
		return "user/mypage/pwChngForm";
		
	} // modifyPw
	
	@GetMapping("/withdraPwCfmForm.do")
	public String removeUserInfo() {
		
		return "user/mypage/withdraPwCfmForm";
		
	} // removeUserInfo

	@GetMapping("/withdraCfmForm.do")
	public String checkRemove() {
		
		return "user/mypage/withdraCfmForm";
		
	} // checkRemove
	
} // class