package kr.co.sist.elysian.admin.reservation.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.elysian.admin.reservation.model.domain.DiningResDomain;
import kr.co.sist.elysian.admin.reservation.model.domain.RoomResDomain;
import kr.co.sist.elysian.admin.reservation.model.domain.RoomResResponse;
import kr.co.sist.elysian.admin.reservation.model.vo.DiningResVO;
import kr.co.sist.elysian.admin.reservation.model.vo.RoomResVO;
import kr.co.sist.elysian.admin.reservation.repository.ResDAO;

@Service
public class ResService {
	
	@Autowired(required = false)
	private ResDAO resDAO;

	/**
	 * DAO에서 가져온 RoomResDomain을 view List column에 맞게 변환
	 * @return roomResResponseList
	 */
	public List<RoomResResponse> searchRoomResList() {
		List<RoomResDomain> roomResList = resDAO.selectRoomResList();
		List<RoomResResponse> roomResResponseList = new ArrayList<RoomResResponse>();
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			for(RoomResDomain roomResDomain : roomResList) {
				switch(roomResDomain.getRoomResStatus()) {
				case "RESERVED" : roomResDomain.setRoomResStatus("<span class='badge bg-light'>RESERVED</span>"); break;
				case "CHECK IN" : roomResDomain.setRoomResStatus("<span class='badge bg-success'>CHECK IN</span>"); break;
				case "CHECK OUT" : roomResDomain.setRoomResStatus("<span class='badge bg-primary'>CHECK OUT</span>"); break;
				case "CANCELED" : roomResDomain.setRoomResStatus("<span class='badge bg-danger'>CANCELED</span>"); break;
				case "NO SHOW" : roomResDomain.setRoomResStatus("<span class='badge bg-secondary'>NO SHOW</span>"); break;
				} // end case
				
				RoomResResponse roomResResponse = RoomResResponse.builder()
						.num(roomResDomain.getNum())
						.payNum("<a href='#' class='resNum'>" + roomResDomain.getPayNum() + "</a>")
						.roomResStatus(roomResDomain.getRoomResStatus())
						.room(roomResDomain.getRoom())
						.checkIn(sdf.format(roomResDomain.getCheckin()))
						.checkOut(sdf.format(roomResDomain.getCheckout()))
						.roomResDate(sdf.format(roomResDomain.getRoomResDate()))
						.engName(roomResDomain.getEngName())
						.guestPhone(roomResDomain.getGuestPhone())
						.build();
				roomResResponseList.add(roomResResponse);
			} // end for
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		return roomResResponseList;
	} // searchRoomResList

	public RoomResDomain detailRoomRes(String roomResNum) {
		return null;
	} // detailRoomRes

	public int modifyRoomRes(RoomResVO roomResVO) {
		return 0;
	} // modifyRoomRes

	public int removeRoomRes(String roomResNum) {
		return 0;
	} // removeRoomRes

	
	public List<DiningResDomain> searchDiningResList() {
		return null;
	} // searchDiningResList

	public DiningResDomain detailDiningRes(String diningResNum) {
		return null;
	} // detailDiningRes

	public int modifyDiningRes(DiningResVO diningResVO) {
		return 0;
	} // modifyDiningRes

	public int removeDiningRes(String diningResNum) {
		return 0;
	} // removeDiningRes
	
} // class