package kr.co.sist.elysian.user.mypage.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sist.elysian.user.mypage.model.domain.DiningResDomain;
import kr.co.sist.elysian.user.mypage.model.domain.MemberDomain;
import kr.co.sist.elysian.user.mypage.model.domain.NationalDomain;
import kr.co.sist.elysian.user.mypage.model.domain.RoomResDomain;
import kr.co.sist.elysian.user.mypage.model.vo.DiningResVO;
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
	 * 로그인한 아이디의 마이페이지-메인 예약 리스트
	 * @param session
	 * @return 예약 리스트
	 */
	@ResponseBody
	@GetMapping("/mainRoomResList.do")
	public String searchMainRoomResList(HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		String jsonObj = myPageService.searchMainRoomResList(userId);
		return jsonObj;
	} // searchMainRoomResList

	/**
	 * 로그인한 아이디의 객실 예약 내역 리스트
	 * @param request
	 * @param session
	 * @param model
	 * @return 객실 예약 내역 리스트
	 */
	@RequestMapping(value="/roomResList.do", method= {GET, POST})
	public String searchRoomResList(HttpServletRequest request, HttpSession session, Model model) {
		String userId = (String)session.getAttribute("userId");
		String roomResStatus = request.getParameter("searchCtgry");
		String agoMonth = request.getParameter("agoMonth");
		String searchDataBeginDe = request.getParameter("searchDataBeginDe");
		String searchDataEndDe = request.getParameter("searchDataEndDe");
		
		// 처음 진입 시에만 3개월 선택, agoMonth가 아닌 다른 날짜 입력이라면 선택X
		if(agoMonth == null && searchDataBeginDe == null && searchDataEndDe == null) {
			agoMonth = "3";
		} else if (agoMonth == null) {
			agoMonth = "";
		} // end else
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("userId", userId);
		map.put("roomResStatus", roomResStatus == null ? "ALL" : roomResStatus);
		map.put("searchDataBeginDe", searchDataBeginDe);
		map.put("searchDataEndDe", searchDataEndDe);
		
		List<RoomResDomain> roomResList = myPageService.searchRoomResList(map);
		
		// view에 전달할 date가 null이라면 기본값 오늘, 3개월 뒤로 설정
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		if(searchDataBeginDe == null && searchDataEndDe == null) {
			searchDataBeginDe = sdf.format(new Date());
			
			Calendar calendar = Calendar.getInstance();
			calendar.add(Calendar.MONTH, 3);
			searchDataEndDe = sdf.format(calendar.getTime());			
		} // end if
		
		model.addAttribute("roomResList", roomResList);
		model.addAttribute("roomResListSize", roomResList.size());
		model.addAttribute("selectedCategory", roomResStatus);
		model.addAttribute("checkedMonth", agoMonth);
		model.addAttribute("searchDataBeginDe", searchDataBeginDe);
		model.addAttribute("searchDataEndDe", searchDataEndDe);
		
		return "user/cnfirm/mber/room/reserveList";
	} // searchRoomResList
	
	/**
	 * 선택한 예약 번호의 예약 상세 정보 조회
	 * @param request
	 * @param model
	 * @return roomResDetail view
	 */
	@GetMapping("/roomResView.do")
	public String detailRoomRes(HttpServletRequest request, Model model) {
		String payNum = request.getParameter("payNum");
		RoomResDomain roomResDomain = myPageService.searchRoomResDetail(payNum);
		model.addAttribute("roomResDomain", roomResDomain);
		return "user/cnfirm/mber/room/reserveView";
	} // detailRoomRes
	
	/**
	 * 선택한 예약 번호의 예약 취소
	 * @param request
	 * @return 예약 취소 결과
	 */
	@ResponseBody
	@PostMapping(value="/resvCancel.do", produces="application/json; charset=UTF-8")
	public String modifyRoomResToCancel(@RequestBody Map<String, Object> requestData) {
		String payNum = (String)requestData.get("payNum");
		String jsonObj = myPageService.modifyRoomResToCancel(payNum);
		return jsonObj;
	} // modifyRoomResToCancel
	
	/**
	 * 다이닝 예약 리스트 매핑
	 * @return 다이닝 예약 리스트 view jsp
	 */
	@GetMapping("/diningResList.do")
	public String searchDiningResList() {
		return "user/cnfirm/mber/dining/reserveList";
	} // searchDiningResList
	
	/**
	 * 로그인한 아이디의 다이닝 예약 리스트 조회 ajax
	 * @param requestData(diningResStatus, searchDateBeginDe, searchDateEndDe)
	 * @param session
	 * @return 다이닝 예약 리스트
	 */
	@ResponseBody
	@PostMapping(value="/diningResListResult.do", produces="application/json; charset=UTF-8")
	public String searchDiningResListResult(@RequestBody Map<String, Object> requestData, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		String diningResStatus = (String)requestData.get("searchCtgry");
		String searchDataBeginDe = (String)requestData.get("searchDataBeginDe");
		String searchDataEndDe = (String)requestData.get("searchDataEndDe");
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("userId", userId);
		map.put("diningResStatus", diningResStatus == null ? "ALL" : diningResStatus);
		map.put("searchDataBeginDe", searchDataBeginDe);
		map.put("searchDataEndDe", searchDataEndDe);
		
		String jsonObj = myPageService.searchDiningResList(map);

		return jsonObj;
	} // searchDiningResListResult

	/**
	 * 다이닝 예약 상세조회 매핑
	 * @return 다이닝 예약 상세조회 view jsp
	 */
	@GetMapping("/diningResView.do")
	public String detailDiningRes(HttpServletRequest request, Model model) {
		String payNum = (String)request.getParameter("payNum");
		model.addAttribute("payNum", payNum);
		return "user/cnfirm/mber/dining/reserveView";
	} // detailDiningRes
	
	/**
	 * 선택한 결제번호(예약번호)의 다이닝 예약 상세 조회 ajax
	 * @param requestData(payNum)
	 * @return 다이닝 예약 상세 정보
	 */
	@ResponseBody
	@PostMapping(value="/diningResViewResult.do", produces="application/json; charset=UTF-8")
	public DiningResDomain detailDiningResResult(@RequestBody Map<String, Object> requestData) {
		String payNum = (String)requestData.get("payNum");
		DiningResDomain diningResDomain = myPageService.searchDiningResDetail(payNum);
		return diningResDomain;
	} // detailDiningResResult
	
	/**
	 * 다이닝 예약 정보수정 매핑
	 * @return 다이닝 예약 정보수정 view jsp
	 */
	@RequestMapping(value="/infoUpdateForm.do", method= {GET, POST})
	public String modifyVisitorInfoForm(HttpServletRequest request, Model model) {
		String payNum = (String)request.getParameter("payNum");
		model.addAttribute("payNum", payNum);
		return "user/cnfirm/mber/dining/infoUpdateForm";
	} // updateVisitorInfoForm

	/**
	 * 다이닝 예약 방문자 정보 수정
	 * @param diningResVO 다이닝 예약 방문자 정보
	 * @return result 수정 결과
	 */
	@ResponseBody
	@PostMapping(value="/modifyVisitorInfo.do", produces="application/json; charset=UTF-8")
	public String modifyVisitorInfo(@RequestBody DiningResVO diningResVO) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("myPageDiningResVO", diningResVO);
		String jsonObj = myPageService.modifyDiningVisitorInfo(paramMap);
		return jsonObj;
	} // modifyVisitorInfo
	
	/**
	 * 선택한 다이닝 예약 번호의 예약 취소
	 * @param request
	 * @return 예약 취소 결과
	 */
	@ResponseBody
	@PostMapping(value="/diningResvCancel.do", produces="application/json; charset=UTF-8")
	public String modifyDiningResToCancel(@RequestBody Map<String, Object> requestData) {
		String payNum = (String)requestData.get("payNum");
		String jsonObj = myPageService.modifyDiningResToCancel(payNum);
		return jsonObj;
	} // modifyDiningResToCancel
	
	/**
	 * 회원 정보 수정 비밀번호 확인 매핑
	 * @return 회원 정보 수정 비밀번호 확인 view jsp
	 */
	@GetMapping("/myInfoPwCfmForm.do")
	public String checkPwUserInfoForm() {
		return "user/mypage/myInfoPwCfmForm";
	} // checkPwUserInfoForm
	
	/**
	 * 회원 정보 수정 진입 전 비밀번호 확인
	 * @param session
	 * @return 비밀번호 확인 결과
	 */
	@ResponseBody
	@PostMapping(value="/checkPwUserInfo.do", produces="application/json; charset=UTF-8")
	public String checkPwUserInfo(@RequestParam String loginPassword, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		String inputPw = loginPassword;
		Map<String, String> paramMap = new HashMap<String, String>();
		
		paramMap.put("userId", userId);
		paramMap.put("inputPw", inputPw);
		
		String jsonObj = myPageService.selectMemberPw(paramMap);
		
		return jsonObj;
	} // checkPwUserInfo
	
	/**
	 * 로그인한 아이디의 회원정보수정 뷰와 상세 정보
	 * @param session 로그인한 아이디
	 * @param model 상세 정보
	 * @return 회원정보수정 뷰
	 */
	@PostMapping("/myInfoForm.do")
	public String detailUserInfo(HttpSession session, Model model) {
		String userId = (String)session.getAttribute("userId");
		MemberDomain memberDomain = myPageService.selectMemberInfo(userId);
		List<NationalDomain> allnationalInfo = myPageService.selectAllNationalInfo();
		
		model.addAttribute(memberDomain);
		model.addAttribute("allnationalInfo", allnationalInfo);
		return "user/mypage/myInfoForm";
	} // detailUserInfo
	
	/**
	 * 휴대폰 번호 변경을 위해 문자 인증 전송
	 * @param requestData 입력한 휴대폰 번호
	 * @return 문자 전송 정보
	 */
	@ResponseBody
	@PostMapping(value="/send-one.do", produces="application/json; charset=UTF-8")
	public String checkPhoneRequestNum(@RequestBody Map<String, Object> requestData) {
		String phoneNumber = (String)requestData.get("authPhone");
		String jsonObj = myPageService.checkPhoneRequestNum(phoneNumber);
		return jsonObj;
	} // checkPhoneRequestNum
	
	/**
	 * 회원정보 수정 내 이메일 중복확인
	 * @param userEmail
	 * @return 이메일 중복확인 결과
	 */
	@ResponseBody
	@PostMapping(value="/checkDupEmail.do", produces="application/json; charset=UTF-8")
	public String checkDupEmail(@RequestParam String email) {
		String jsonObj = myPageService.checkDupEmail(email);
		return jsonObj;
	} // checkDupEmail
	
	@ResponseBody
	@PostMapping(value="/modifyMemberInfo.do", produces="application/json; charset=UTF-8")
	public String modifyMemberInfo(@RequestBody MemberDomain memberDomain, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userId", userId);
		paramMap.put("memberDomain", memberDomain);
		String jsonObj = myPageService.modifyMemberInfo(paramMap);
		return jsonObj;
	} // modifyMemberInfo
	 
	/**
	 * 비밀번호 변경 페이지 view 매핑
	 * @param session userId
	 * @param model 
	 * @return 비밀번호 변경 페이지 view jsp
	 */
	@GetMapping("/pwChngForm.do")
	public String modifyPw(HttpSession session, Model model) {
		String userId = (String)session.getAttribute("userId");
		model.addAttribute("userId", userId);
		return "user/mypage/pwChngForm";
	} // modifyPw
	
	@GetMapping("/withdraPwCfmForm.do")
	public String checkRemove() {
		
		return "user/mypage/withdraPwCfmForm";
		
	} // checkRemove

	@GetMapping("/withdraCfmForm.do")
	public String removeUserInfo() {
		
		return "user/mypage/withdraCfmForm";
		
	} // removeUserInfo
	
} // class