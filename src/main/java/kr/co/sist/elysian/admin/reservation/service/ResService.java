package kr.co.sist.elysian.admin.reservation.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.elysian.admin.reservation.model.domain.DiningResDomain;
import kr.co.sist.elysian.admin.reservation.model.domain.RoomResDomain;
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
	public List<RoomResDomain> searchRoomResList() {
		List<RoomResDomain> roomResList = resDAO.selectRoomResList();
		List<RoomResDomain> roomResResponseList = new ArrayList<RoomResDomain>();
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
				
				RoomResDomain roomResResponse = RoomResDomain.builder()
						.num(roomResDomain.getNum())
						.payNum("<a href='#' class='payNum'>" + roomResDomain.getPayNum() + "</a>")
						.roomResStatus(roomResDomain.getRoomResStatus())
						.room(roomResDomain.getRoom())
						.checkInStr(sdf.format(roomResDomain.getCheckIn()))
						.checkOutStr(sdf.format(roomResDomain.getCheckOut()))
						.roomResDateStr(sdf.format(roomResDomain.getRoomResDate()))
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

	
	/**
	 * DAO에서 가져온 DiningResDomain을 view List column에 맞게 변환
	 * @return diningResResponseList
	 */
	public List<DiningResDomain> searchDiningResList() {
		List<DiningResDomain> diningResList = resDAO.selectDiningResList();
		List<DiningResDomain> diningResResponseList = new ArrayList<DiningResDomain>();
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat sdfTime = new SimpleDateFormat("a HH:mm");
			
			for(DiningResDomain diningResDomain : diningResList) {
				switch(diningResDomain.getDiningResStatus()) {
				case "COMPLETED" : diningResDomain.setDiningResStatus("<span class='badge bg-success'>이용 완료</span>"); break;
				case "CONFIRMED" : diningResDomain.setDiningResStatus("<span class='badge bg-light'>예약</span>"); break;
				case "CANCELLED" : diningResDomain.setDiningResStatus("<span class='badge bg-danger'>취소</span>"); break;
				case "NO SHOW" : diningResDomain.setDiningResStatus("<span class='badge bg-secondary'>NO SHOW</span>"); break;
				} // end case
				
				DiningResDomain diningResResponse = DiningResDomain.builder()
						.num(diningResDomain.getNum())
						.payNum("<a href='#' class='payNum'>" + diningResDomain.getPayNum() + "</a>")
						.diningResStatus(diningResDomain.getDiningResStatus())
						.diningName(diningResDomain.getDiningName())
						.visitDate(sdf.format(diningResDomain.getVisitDateTime()))
						.visitTime(sdfTime.format(diningResDomain.getVisitDateTime()))
						.visitPeopleStr(diningResDomain.getVisitPeople() + "명")
						.visitorName(diningResDomain.getVisitorName())
						.visitorPhone(diningResDomain.getVisitorPhone())
						.diningResDateStr(sdf.format(diningResDomain.getDiningResDate()))
						.build();
				diningResResponseList.add(diningResResponse);
			} // end for
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		return diningResResponseList;
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