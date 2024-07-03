package kr.co.sist.elysian.admin.room.repository;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sist.elysian.admin.room.model.domain.RoomDomain;
import kr.co.sist.elysian.admin.room.model.domain.RoomListDomain;
import kr.co.sist.elysian.admin.room.model.vo.RoomVO;
import kr.co.sist.elysian.common.dao.MyBatisDAO;

@Repository("adminRoomDAO")
public class RoomDAO {

	@Autowired(required = false)
	private MyBatisDAO mbDAO;
	
	/**
	 * 객실 리스트 호출 메서드
	 * @return 객실 리스트
	 * @throws PersistenceException
	 */
	public List<RoomListDomain> selectRoomList() throws PersistenceException{
		
		List<RoomListDomain> list = null;
		
		SqlSession ss= mbDAO.getMyBatisHandler(false);
		list = ss.selectList("kr.co.sist.elysian.admin.room.roomList");
		mbDAO.closeHandler(ss);
		return list;
		
	}//selectRoomList
	
	
	/**
	 * 객실 세부정보 호출 메서드
	 * @param roomId 객실번호 
	 * @return 객실도메인
	 * @throws PersistenceException
	 */
	public RoomDomain selectRoomDetail(int roomId) throws PersistenceException{
		
		RoomDomain rd = null;
		
		SqlSession ss= mbDAO.getMyBatisHandler(false);
		rd = ss.selectOne("kr.co.sist.elysian.admin.room.roomDetail",roomId);
		mbDAO.closeHandler(ss);
		return rd;
		
	}//selectRoomDetail
	
	
	
	/**
	 * 객실정보 수정 메서드
	 * @param urVO 객실VO
	 * @return 1이면 성공 
	 * @throws PersistenceException
	 */
	public int updateRoom(RoomVO rVO) throws PersistenceException{
		
		SqlSession ss= mbDAO.getMyBatisHandler(true);
		int result = ss.update("kr.co.sist.elysian.admin.room.updateRoom",rVO);
		mbDAO.closeHandler(ss);
		return result;
		
	}//updateRoom
	
	
	
	/**
	 * 객실번호 호출 메서드
	 * @param selectedFloor 층수
	 * @return 객실번호
	 * @throws PersistenceException
	 */
	public int selectRoomId(int selectedFloor) throws PersistenceException{
		
		SqlSession ss= mbDAO.getMyBatisHandler(true);
		int result = ss.selectOne("kr.co.sist.elysian.admin.room.selectRoomId",selectedFloor);
		mbDAO.closeHandler(ss);
		return result;
		
	}//selectRoomId
	
	
	
	
	
	/**
	 * 객실등록메서드
	 * @param rVO 객실VO
	 * @return  1이면 성공
	 * @throws PersistenceException
	 */
	public int insertRoom(RoomVO rVO) throws PersistenceException{
		
		SqlSession ss= mbDAO.getMyBatisHandler(true);
		int result = ss.insert("kr.co.sist.elysian.admin.room.insertRoom",rVO);
		mbDAO.closeHandler(ss);
		return result;
		
	}//insertRoom
	
	
}
