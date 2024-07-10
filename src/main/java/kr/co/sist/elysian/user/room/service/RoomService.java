package kr.co.sist.elysian.user.room.service;


import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.elysian.user.home.model.HomeDomain;
import kr.co.sist.elysian.user.room.model.domain.MemberDomain;
import kr.co.sist.elysian.user.room.model.domain.RoomDomain;
import kr.co.sist.elysian.user.room.model.domain.RoomListDomain;
import kr.co.sist.elysian.user.room.model.vo.RoomResVO;
import kr.co.sist.elysian.user.room.repository.RoomDAO;

@Service("userRoomService")
public class RoomService {


	@Autowired(required = false)
	private RoomDAO rDAO;
	private final String uploadPath = "http://localhost/hotel_prj/util/event_img/";

	/**
	 * 객실리스트 검색 메서드
	 * @param rrVO 객실예약VO
	 * @return 객실리스트
	 */
	public List<RoomListDomain> searchRoomList(RoomResVO rrVO){
		List<RoomListDomain> list = null;
		try {
			list =rDAO.selectRoomList(rrVO);
		}catch(PersistenceException pe){
			pe.printStackTrace();

		}//end catch
		return list;


	}//searchRoomList

	/**
	 * 멤버 검색 메서드
	 * @param userId 멤버id
	 * @return 멤버 도메인
	 */
	public MemberDomain searchMember(String userId){
		MemberDomain umd = null;
		try {
			umd =rDAO.selectMember(userId);
		}catch(PersistenceException pe){
			pe.printStackTrace();

		}//end catch
		return umd;


	}//searchMember



	/**
	 * 객실예약 검증 메서드
	 * @param rrVO 객실예약VO
	 * @return 객실번호
	 */
	public int resveValid(RoomResVO rrVO){
		int roomId = 0;
		try {
			roomId =rDAO.resveValid(rrVO);
		}catch(PersistenceException pe){
			pe.printStackTrace();

		}//end catch
		return roomId;


	}//resveValid





	/**
	 * 객실예약 등록 메서드
	 * @param rrVO 객실예약VO
	 * @return 성공실패유무
	 */
	public boolean insertRoomRes(RoomResVO rrVO){
		int result = 0;
		try {
			result =rDAO.insertRoomRes(rrVO);
		}catch(PersistenceException pe){
			pe.printStackTrace();

		}//end catch



		return (result==1);


	}//insertRoomRes

	
	
	/**
	 * DAO에서 셀렉해온 최근 이벤트 리스트 6개를 전달
	 * @return 최근 이벤트 리스트 6개
	 */
	public List<RoomDomain> selectRoomEvent() {
		
		List<RoomDomain> roomEventList = null;
		
		try {
			roomEventList = rDAO.selectRoomEvent();
			
			String eventFullPath = "img_event.jpg";
			String eventSubFullPath = "img_event.jpg";
			
			for(RoomDomain roomEvent : roomEventList) {
				eventFullPath = uploadPath + roomEvent.getEventMainImg();
				eventSubFullPath = uploadPath + roomEvent.getEventSubImg();
				
				roomEvent.setEventImgFullPath(eventFullPath);
				roomEvent.setEventSubImgFullPath(eventSubFullPath);
			} // end for
			
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		return roomEventList;	
	} // selectHomeEvent







}
