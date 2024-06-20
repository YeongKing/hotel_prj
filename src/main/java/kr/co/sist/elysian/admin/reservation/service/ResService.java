package kr.co.sist.elysian.admin.reservation.service;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.elysian.admin.reservation.model.domain.DiningResDomain;
import kr.co.sist.elysian.admin.reservation.model.domain.RoomInfoDomain;
import kr.co.sist.elysian.admin.reservation.model.domain.RoomResDomain;
import kr.co.sist.elysian.admin.reservation.model.vo.DiningResVO;
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
		List<RoomResDomain> roomResResponseList = new ArrayList<RoomResDomain>();
		try {
			List<RoomResDomain> roomResList = resDAO.selectRoomResList();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
			
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

	/**
	 * DAO에서 가져온 RoomResDomain을 예약번호별 view에 맞게 변환
	 * @param payNum
	 * @return roomResResponseDomain
	 */
	public RoomResDomain detailRoomRes(String payNum) {
		RoomResDomain roomResResponseDomain = null;
		try {
			RoomResDomain roomResDomain = resDAO.selectOneRoomRes(payNum);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
			DecimalFormat df = new DecimalFormat("###,###,###");
			
			roomResResponseDomain = RoomResDomain.builder()
							.payNum(roomResDomain.getPayNum())
							.roomId(roomResDomain.getRoomId())
							.room(roomResDomain.getRoom())
							.roomResStatus(roomResDomain.getRoomResStatus())
							.adultsNumStr(roomResDomain.getAdultsNum() + "명")
							.kidsNumStr(roomResDomain.getKidsNum() + "명")
							.checkInStr(sdf.format(roomResDomain.getCheckIn()))
							.checkOutStr(sdf.format(roomResDomain.getCheckOut()))
							.engName(roomResDomain.getEngName())
							.guestPhone(roomResDomain.getGuestPhone())
							.guestEmail(roomResDomain.getGuestEmail())
							.guestRequest(roomResDomain.getGuestRequest())
							.cardName(roomResDomain.getCardName())
							.cardNum(roomResDomain.getCardNum())
							.payPriceStr(df.format(roomResDomain.getPayPrice()) + "원")
							.payTimeStr(sdf.format(roomResDomain.getPayTime()))
							.build();
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		return roomResResponseDomain;
	} // detailRoomRes
	
	/**
	 * DAO에서 가져온 roomInfoList 반환
	 * @param paramMap(체크인일자, 체크아웃일자)
	 * @return roomInfoList
	 */
	public List<RoomInfoDomain> searchRoomInfoList(Map<String, String> paramMap) {
		List<RoomInfoDomain> roomInfoList = null;
		try {
			roomInfoList = resDAO.selectRoomInfoList(paramMap);
			
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		return roomInfoList;
	} // searchRoomInfo
	
	/**
	 * DAO에서 checkin 처리 후 결과 반환(결과가 1일 때만 true)
	 * @param paramMap(예약 번호, 세션 아이디)
	 * @return updateFlag(처리 여부)
	 */
	public boolean modifyRoomResToCheckin(Map<String, String> paramMap) {
		boolean updateFlag = false;
		try {
			int result = resDAO.updateRoomResToCheckin(paramMap);
			if(result == 1) {
				updateFlag = true;
			} // end if
		} catch(PersistenceException pe) {
			pe.printStackTrace();
			updateFlag = false;
		} // end catch
		return updateFlag;
	} // modifyRoomResToCheckin
	
	/**
	 * DAO에서 checkout 처리 후 결과 반환(결과가 1일 때만 true)
	 * @param paramMap(예약 번호, 세션 아이디)
	 * @return updateFlag(처리 여부)
	 */
	public boolean modifyRoomResToCheckout(Map<String, String> paramMap) {
		boolean updateFlag = false;
		try {
			int result = resDAO.updateRoomResToCheckout(paramMap);
			if(result == 1) {
				updateFlag = true;
			} // end if
		} catch(PersistenceException pe) {
			pe.printStackTrace();
			updateFlag = false;
		} // end catch
		return updateFlag;
	} // modifyRoomResToCheckout
	
	/**
	 * DAO에서 예약 취소 처리 후 결과 반환(결과가 1일 때만 true)
	 * @param paramMap(예약 번호, 세션 아이디)
	 * @return updateFlag(처리 여부)
	 */
	public boolean modifyRoomResToCancel(Map<String, String> paramMap) {
		boolean updateFlag = false;
		try {
			int result = resDAO.updateRoomResToCancel(paramMap);
			if(result == 1) {
				updateFlag = true;
			} // end if
		} catch (PersistenceException pe) {
			pe.printStackTrace();
			updateFlag = false;
		} // end catch
		return updateFlag;
	} // modifyRoomResToCancel

	/**
	 * DAO에서 예약 수정 처리 후 결과 반환(결과가 1일 때만 true)
	 * @param roomResVO(예약 정보 VO)
	 * @return updateFlag(처리 여부)
	 */
	public boolean modifyRoomRes(Map<String, Object> paramMap) {
		boolean updateFlag = false;
		try {
			int result = resDAO.updateRoomRes(paramMap);
			if(result == 1) {
				updateFlag = true;
			} // end if
		} catch (PersistenceException pe) {
			pe.printStackTrace();
			updateFlag = false;
		} // end catch
		return updateFlag;
	} // modifyRoomRes
	
	/**
	 * DAO에서 가져온 DiningResDomain을 view List column에 맞게 변환
	 * @return diningResResponseList
	 */
	public List<DiningResDomain> searchDiningResList() {
		List<DiningResDomain> diningResList = resDAO.selectDiningResList();
		List<DiningResDomain> diningResResponseList = new ArrayList<DiningResDomain>();
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
			SimpleDateFormat sdfTime = new SimpleDateFormat("a hh:mm");
			
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

	public DiningResDomain detailDiningRes(String payNum) {
		return null;
	} // detailDiningRes

	public int modifyDiningRes(DiningResVO diningResVO) {
		return 0;
	} // modifyDiningRes

	public int removeDiningRes(String payNum) {
		return 0;
	} // removeDiningRes
	
} // class