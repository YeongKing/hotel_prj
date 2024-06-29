package kr.co.sist.elysian.admin.reservation.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sist.elysian.admin.reservation.model.domain.DiningResDomain;
import kr.co.sist.elysian.admin.reservation.model.domain.RoomInfoDomain;
import kr.co.sist.elysian.admin.reservation.model.domain.RoomResDomain;
import kr.co.sist.elysian.admin.reservation.model.vo.DiningResVO;
import kr.co.sist.elysian.admin.reservation.model.vo.RoomResVO;
import kr.co.sist.elysian.admin.reservation.service.ResService;

@Controller("adminResController")
@RequestMapping("/admin")
public class ResController {
	
	@Autowired(required = false)
	private ResService resService;
	
	/**
	 * 객실 예약 관리 페이지 매핑
	 * @return 객실 예약 관리 페이지 view jsp
	 */
	@GetMapping("/roomResve.do")
	public String viewRoomResPage() {
		return "/admin/resve/roomResve";
	}//viewRoomResPage
	
	/**
	 * 예약 전체 리스트 조회
	 * @return 예약 전체 리스트(dataTables 사용으로 return명은 data로 지정)
	 */
	@ResponseBody
	@PostMapping(value="/roomResList.do", produces="application/json; charset=UTF-8")
	public List<RoomResDomain> searchRoomResList() {
		List<RoomResDomain> data = resService.searchRoomResList();
		return data;
	}//searchRoomResList

	/**
	 * 예약 번호 클릭 시 해당 예약에 대한 정보 조회
	 * @param requestData 예약 번호
	 * @return roomResDomain 예약 정보
	 */ 
	@ResponseBody
	@PostMapping(value="/roomResDetail.do", produces="application/json; charset=UTF-8")
	public RoomResDomain detailRoomRes(@RequestBody Map<String, Object> requestData) {
		String payNum = (String)requestData.get("payNum");
		RoomResDomain roomResDomain = resService.detailRoomRes(payNum);
		return roomResDomain;
	}//detailRoomRes
	
	/**
	 * 예약 상세조회 모달 창 내 예약 가능한 객실과 정보 조회
	 * @param requestData 체크인, 체크아웃 날짜
	 * @return roomInfoList 객실 정보
	 */
	@ResponseBody
	@PostMapping(value="/roomInfo.do", produces="application/json; charset=UTF-8")
	public List<RoomInfoDomain> searchRoomInfoList(@RequestBody Map<String, Object> requestData) {
		String checkIn = (String)requestData.get("checkIn");
		String checkOut = (String)requestData.get("checkOut");
		Map<String, String> paramMap = new HashMap<String, String>();
		
		paramMap.put("checkIn", checkIn);
		paramMap.put("checkOut", checkOut);
		
		List<RoomInfoDomain> roomInfoList = resService.searchRoomInfoList(paramMap);
		return roomInfoList;
	} // searchRoomInfoList
	
	/**
	 * 예약 정보 수정
	 * @param roomResVO 예약정보
	 * @param session 로그인 아이디 체크를 위한 세션
	 * @return result 수정 결과
	 */
	@ResponseBody
	@PostMapping(value="/modifyRoomRes.do", produces="application/json; charset=UTF-8")
	public boolean modifyRoomRes(@RequestBody RoomResVO roomResVO, HttpSession session) {
		String adminId = (String)session.getAttribute("adminId");
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("roomResVO", roomResVO);
		paramMap.put("adminId", adminId);
		
		boolean result = resService.modifyRoomRes(paramMap);
		return result;
	}//modifyRoomRes
	
	/**
	 * 예약 상세조회 모달 창 내 체크인 처리
	 * @param requestData 예약 번호
	 * @param session 로그인 아이디 체크를 위한 세션
	 * @return result 체크인 결과
	 */
	@ResponseBody
	@PostMapping(value="/checkin.do", produces="application/json; charset=UTF-8")
	public boolean modifyRoomResToCheckin(@RequestBody Map<String, Object> requestData, HttpSession session) {
		String payNum = (String)requestData.get("payNum");
		String adminId = (String)session.getAttribute("adminId");
		Map<String, String> paramMap = new HashMap<String, String>();
		
		paramMap.put("payNum", payNum);
		paramMap.put("adminId", adminId);
		
		boolean result = resService.modifyRoomResToCheckin(paramMap);
		return result;
	} // modifyRoomResToCheckout
	
	/**
	 * 예약 상세조회 모달 창 내 체크아웃 처리
	 * @param requestData 예약 번호
	 * @param session 로그인 아이디 체크를 위한 세션
	 * @return result 체크아웃 결과
	 */
	@ResponseBody
	@PostMapping(value="/checkout.do", produces="application/json; charset=UTF-8")
	public boolean modifyRoomResToCheckout(@RequestBody Map<String, Object> requestData, HttpSession session) {
		String payNum = (String)requestData.get("payNum");
		String adminId = (String)session.getAttribute("adminId");
		Map<String, String> paramMap = new HashMap<String, String>();
		
		paramMap.put("payNum", payNum);
		paramMap.put("adminId", adminId);
		
		boolean result = resService.modifyRoomResToCheckout(paramMap);
		return result;
	} // modifyRoomResToCheckout
	
	/**
	 * 예약 상세조회 모달 창 내 예약 취소 처리
	 * @param requestData 예약 번호
	 * @param session 로그인 아이디 체크를 위한 세션
	 * @return result 체크아웃 결과
	 */
	@ResponseBody
	@PostMapping(value="/cancelRoomRes.do", produces="application/json; charset=UTF-8")
	public boolean modifyRoomResToCancel(@RequestBody Map<String, Object> requestData, HttpSession session) {
		String payNum = (String)requestData.get("payNum");
		String adminId = (String)session.getAttribute("adminId");
		Map<String, String> paramMap = new HashMap<String, String>();
		
		paramMap.put("payNum", payNum);
		paramMap.put("adminId", adminId);
		
		boolean result = resService.modifyRoomResToCancel(paramMap);
		return result;
	} // modifyRoomResToCancel
	
	/**
	 * 다이닝 예약 관리 페이지 매핑
	 * @return 다이닝 예약 관리 페이지 view jsp
	 */
	@GetMapping("/diningResve.do")
	public String viewDiningResPage() {
		return "/admin/resve/diningResve";
	}//viewDiningResPage
	
	/**
	 * 예약 전체 리스트 조회
	 * @return 예약 전체 리스트(dataTables 사용으로 return명은 data로 지정)
	 */
	@ResponseBody
	@PostMapping(value="/diningResList.do", produces="application/json; charset=UTF-8")
	public List<DiningResDomain> searchDiningResList() {
		List<DiningResDomain> data = resService.searchDiningResList();
		return data;
	}//searchRoomResList
	
	/**
	 * 예약 번호 클릭 시 해당 예약에 대한 정보 조회
	 * @param requestData 예약 번호
	 * @return diningResDomain 예약 정보
	 */ 
	@ResponseBody
	@PostMapping(value="/diningResDetail.do", produces="application/json; charset=UTF-8")
	public DiningResDomain detailDiningRes(@RequestBody Map<String, Object> requestData) {
		String payNum = (String)requestData.get("payNum");
		DiningResDomain diningResDomain = resService.detailDiningRes(payNum);
		return diningResDomain;
	}//detailRoomRes
	
	public String modifyDiningRes(DiningResVO drVO, Model model) {
		return "";
	}//detailDiningRes
	
	/**
	 * 예약 정보 수정
	 * @param diningResVO 예약정보
	 * @param session 로그인 아이디 체크를 위한 세션
	 * @return result 수정 결과
	 */
	@ResponseBody
	@PostMapping(value="/modifyDiningRes.do", produces="application/json; charset=UTF-8")
	public boolean modifyDiningRes(@RequestBody DiningResVO diningResVO, HttpSession session) {
		String adminId = (String)session.getAttribute("adminId");
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("diningResVO", diningResVO);
		paramMap.put("adminId", adminId);
		
		boolean result = resService.modifyDiningRes(paramMap);
		return result;
	}//modifyDiningRes
	
	/**
	 * 예약 상세조회 모달 창 내 이용완료 처리
	 * @param requestData 예약 번호
	 * @param session 로그인 아이디 체크를 위한 세션
	 * @return result 이용완료 처리 결과
	 */
	@ResponseBody
	@PostMapping(value="/completeDiningRes.do", produces="application/json; charset=UTF-8")
	public boolean modifyDiningResToComplete(@RequestBody Map<String, Object> requestData, HttpSession session) {
		String payNum = (String)requestData.get("payNum");
		String adminId = (String)session.getAttribute("adminId");
		Map<String, String> paramMap = new HashMap<String, String>();
		
		paramMap.put("payNum", payNum);
		paramMap.put("adminId", adminId);
		
		boolean result = resService.modifyDiningResToComplete(paramMap);
		return result;
	} // modifyDiningResToComplete
	
	/**
	 * 예약 상세조회 모달 창 내 예약 취소 처리
	 * @param requestData 예약 번호
	 * @param session 로그인 아이디 체크를 위한 세션
	 * @return result 취소 처리 결과
	 */
	@ResponseBody
	@PostMapping(value="/cancelDiningRes.do", produces="application/json; charset=UTF-8")
	public boolean modifyDiningResToCancel(@RequestBody Map<String, Object> requestData, HttpSession session) {
		String payNum = (String)requestData.get("payNum");
		String adminId = (String)session.getAttribute("adminId");
		Map<String, String> paramMap = new HashMap<String, String>();
		
		paramMap.put("payNum", payNum);
		paramMap.put("adminId", adminId);
		
		boolean result = resService.modifyDiningResToCancel(paramMap);
		return result;
	} // modifyDiningResToCancel
	
} // class