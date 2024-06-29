package kr.co.sist.elysian.admin.room.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.sist.elysian.admin.room.model.domain.RoomDomain;
import kr.co.sist.elysian.admin.room.model.domain.RoomListDomain;
import kr.co.sist.elysian.admin.room.model.vo.RoomVO;
import kr.co.sist.elysian.admin.room.model.vo.UpdateRoomVO;
import kr.co.sist.elysian.admin.room.service.RoomService;

@Controller("adminRoomController")
@RequestMapping("/admin")
public class RoomController {
	
	@Autowired(required = false)
	@Qualifier("adminRoomService")
	private RoomService rs;
	
	
	@GetMapping("/room.do")
	public String searchRoomList(Model model) {
		List<RoomListDomain> list = rs.searchRoomList();
		model.addAttribute("roomList",list);
		

		return "admin/room/room";
	}//searchRoomList

	/**
	 * 객실 상세조회
	 * @param requestData
	 * @param model
	 * @return
	 */
	@ResponseBody
	@PostMapping(value="/roomDetail.do", produces="application/json; charset=UTF-8")
	public RoomDomain selectRoomDetail(@RequestBody Map<String, Object> requestData) {
		int roomId =  Integer.parseInt((String)requestData.get("roomId")); 
	    RoomDomain rd = rs.searchRoomDetail(roomId);

		return rd;
	}//selectRoomDetail
	
	/**
	 * 객실 정보 변경
	 * @param urVO
	 * @param model
	 * @return
	 */
	@ResponseBody
	@PostMapping(value="/updateRoom.do", produces="application/json; charset=UTF-8")
	public Boolean updateRoom(@RequestBody UpdateRoomVO urVO) {

	     boolean result = rs.updateRoom(urVO);
	     
		return result;
	}//updateRoom
	
	
	
	/**
	 * 객실등록 모달창에서 객실층 선택시 해당 층의 가장 마지막 객실번호 +1 반환
	 * @param requestData
	 * @return
	 */
	@ResponseBody
	@PostMapping(value="/selectRoomId.do", produces="application/json; charset=UTF-8")
	public int selectRoomId(@RequestBody Map<String, Object> requestData) {
		
		int selectedFloor =  Integer.parseInt(((String)requestData.get("selectedFloor")));
		
	    int result = rs.selectRoomId(selectedFloor);
	     
		return result;
	}//selectRoomId
	
	
	
	/**
	 * 객실등록 
	 * @param rVO
	 * @return
	 */
	@ResponseBody
	@PostMapping(value="/insertRoom.do", produces="application/json; charset=UTF-8")
	public boolean insertRoom(@RequestBody RoomVO rVO) {
		
	    boolean result = rs.insertRoom(rVO);
	    
		return result;
	}//insertRoom
	
	
	
	
	
	
	
	
	
	
	
	
	public String addFrm() {
		return "";
	}//addFrm
	
	
	public String frmProcess(RoomVO rVO) {
		return "";
	}//frmProcess
	
	
	public String detailRoom(int roomId, Model model) {
		return "";
	}//detailRoom
	

	
	
	public String removeRoom(int roomId, Model model) {
		return "";
	}//removeRoom
	
	
	public String logout(SessionStatus ss) {
		return "";
	}//logout
	
	
	
	
	
	
} // class