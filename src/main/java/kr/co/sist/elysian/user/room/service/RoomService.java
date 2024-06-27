package kr.co.sist.elysian.user.room.service;


import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.elysian.user.pay.model.vo.PayVO;
import kr.co.sist.elysian.user.room.model.domain.MemberDomain;
import kr.co.sist.elysian.user.room.model.domain.RoomListDomain;
import kr.co.sist.elysian.user.room.model.vo.RoomResVO;
import kr.co.sist.elysian.user.room.repository.RoomDAO;

@Service("userRoomService")
public class RoomService {


	@Autowired(required = false)
	private RoomDAO rDAO;
	
	public List<RoomListDomain> searchRoomList(RoomResVO rrVO){
		List<RoomListDomain> list = null;
		try {
			list =rDAO.selectRoomList(rrVO);
		}catch(PersistenceException pe){
			pe.printStackTrace();
			
		}//end catch
		return list;
		
		
	}//searchRoomList
	
	public MemberDomain searchMember(String userId){
		MemberDomain umd = null;
		try {
			umd =rDAO.selectMember(userId);
		}catch(PersistenceException pe){
			pe.printStackTrace();
			
		}//end catch
		return umd;
		
		
	}//searchMember
	
	
	
	public int resveValid(RoomResVO rrVO){
		int roomId = 0;
		try {
			roomId =rDAO.resveValid(rrVO);
		}catch(PersistenceException pe){
			pe.printStackTrace();
			
		}//end catch
		return roomId;
		
		
	}//resveValid
	
	
	public boolean insertRoomRes(RoomResVO rrVO){
		int result = 0;
		try {
			result =rDAO.insertRoomRes(rrVO);
		}catch(PersistenceException pe){
			pe.printStackTrace();
			
		}//end catch
		
		
		
		return (result==1);
		
		
	}//insertRoomRes
	
	

	
	
	
	
	
	
}
