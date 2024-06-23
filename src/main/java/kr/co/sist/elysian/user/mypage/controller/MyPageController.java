package kr.co.sist.elysian.user.mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sist.elysian.user.mypage.service.MyPageService;

@Controller("userMyPageController")
@RequestMapping("/user")
public class MyPageController {
	
	@Autowired(required = false)
	private MyPageService myPageService;
	
	/**
	 * 마이페이지 메인 매핑
	 * @return 마이페이지 view jsp
	 */
	@GetMapping("/mypage.do")
	public String main() {
		return "user/mypage/main";
	} // main
	
	/**
	 * 로그인한 아이디의 lnb정보(이름) 조회
	 * @param session
	 * @return lnbInfo
	 */
	@ResponseBody
	@PostMapping("/mypage/lnbInfoApi.do")
	public String searchInfo(HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		String data = myPageService.searchUserName(userId);
		return data;
	} // searchInfo
	
	/**
	 * 로그인한 아이디의 예약 리스트
	 * @param session
	 * @return 예약 리스트
	 */
	@ResponseBody
	@PostMapping("/mainRoomResList.do")
	public String searchMainRoomResList(HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		String jsonObj = myPageService.searchMainRoomResList(userId);
		return jsonObj;
	} // searchMainRoomResList

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