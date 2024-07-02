package kr.co.sist.elysian.admin.room.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.elysian.admin.room.model.domain.RoomDomain;
import kr.co.sist.elysian.admin.room.model.domain.RoomListDomain;
import kr.co.sist.elysian.admin.room.model.vo.RoomVO;
import kr.co.sist.elysian.admin.room.repository.RoomDAO;

@Service("adminRoomService")
public class RoomService {

	
	@Autowired(required = false)
	private RoomDAO rDAO;
	
	/**
	 * 객실 리스트 호출 메서드
	 * @return 객실 리스트
	 */
	public List<RoomListDomain> searchRoomList(){
		List<RoomListDomain> list = null;
		try {
			list =rDAO.selectRoomList();
		}catch(PersistenceException pe){
			pe.printStackTrace();
			
		}//end catch
		return list;
		
		
	}//searchRoomList
	
	/**
	 * 
	 * 객실 세부사항 호출 메서드
	 * @param roomId 객실번호
	 * @return 객실도메인
	 */
	public RoomDomain searchRoomDetail(int roomId){
		RoomDomain rD = null;
		try {
			rD =rDAO.selectRoomDetail(roomId);
		}catch(PersistenceException pe){
			pe.printStackTrace();
			
		}//end catch
		return rD;
		
		
		
	}//searchMemberDetail
	
	/**
	 * 객실 세부사항 수정 메서드
	 * @param urVO 객실VO
	 * @return 성공실패유무
	 */
	public boolean updateRoom(RoomVO rVO){
		
		try {
			int result =rDAO.updateRoom(rVO);
			return result>0;
		}catch(PersistenceException pe){
			pe.printStackTrace();
			return false;
		}//end catch
	}//updateRoom
	
	
	
	/**
	 * 객실번호 호출 메서드
	 * @param selectedFloor 객실층
	 * @return 객실번호
	 */
	public int selectRoomId(int selectedFloor){
		int result = 0;
		
		try {
			 result =rDAO.selectRoomId(selectedFloor);

		}catch(PersistenceException pe){
			pe.printStackTrace();
		}//end catch
		
		return result;
	}//selectRoomId
	
	/**
	 * 객실등록메서드
	 * @param rVO 객실VO
	 * @return 성공실패유무
	 */
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
