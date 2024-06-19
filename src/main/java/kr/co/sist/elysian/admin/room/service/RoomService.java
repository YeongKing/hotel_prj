package kr.co.sist.elysian.admin.room.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.elysian.admin.room.model.domain.RoomDomain;
import kr.co.sist.elysian.admin.room.model.domain.RoomListDomain;
import kr.co.sist.elysian.admin.room.model.vo.RoomVO;
import kr.co.sist.elysian.admin.room.model.vo.UpdateRoomVO;
import kr.co.sist.elysian.admin.room.repository.RoomDAO;

@Service
public class RoomService {

	
	@Autowired(required = false)
	private RoomDAO rDAO;
	
	public List<RoomListDomain> searchRoomList(){
		List<RoomListDomain> list = null;
		try {
			list =rDAO.selectRoomList();
		}catch(PersistenceException pe){
			pe.printStackTrace();
			
		}//end catch
		return list;
		
		
	}//searchRoomList
	
	public RoomDomain searchRoomDetail(int roomId){
		RoomDomain rD = null;
		try {
			rD =rDAO.selectRoomDetail(roomId);
		}catch(PersistenceException pe){
			pe.printStackTrace();
			
		}//end catch
		return rD;
		
		
		
	}//searchMemberDetail
	
	public boolean updateRoom(UpdateRoomVO urVO){
		
		try {
			int result =rDAO.updateRoom(urVO);
			return result>0;
		}catch(PersistenceException pe){
			pe.printStackTrace();
			return false;
		}//end catch
	}//updateRoom
	
	
	
	public int selectRoomId(int selectedFloor){
		int result = 0;
		
		try {
			 result =rDAO.selectRoomId(selectedFloor);

		}catch(PersistenceException pe){
			pe.printStackTrace();
		}//end catch
		
		return result;
	}//selectRoomId
	
	public boolean insertRoom(RoomVO rVO){
		
		try {
			int result =rDAO.insertRoom(rVO);
			return result>0;
		}catch(PersistenceException pe){
			pe.printStackTrace();
			return false;
		}//end catch
	}//insertRoom
	
	
	
	
}
