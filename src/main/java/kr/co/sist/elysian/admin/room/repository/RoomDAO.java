package kr.co.sist.elysian.admin.room.repository;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sist.elysian.admin.member.model.domain.MemberDomain;
import kr.co.sist.elysian.admin.room.model.domain.RoomDomain;
import kr.co.sist.elysian.admin.room.model.domain.RoomListDomain;
import kr.co.sist.elysian.common.dao.MyBatisDAO;

@Repository
public class RoomDAO {

	@Autowired(required = false)
	private MyBatisDAO mbDAO;
	
	public List<RoomListDomain> selectRoomList() throws PersistenceException{
		
		List<RoomListDomain> list = null;
		
		SqlSession ss= mbDAO.getMyBatisHandler(false);
		list = ss.selectList("kr.co.sist.elysian.admin.room.roomList");
		mbDAO.closeHandler(ss);
		return list;
		
	}//selectRoomList
	
	public RoomDomain selectRoomDetail(int roomId) throws PersistenceException{
		
		RoomDomain rd = null;
		
		SqlSession ss= mbDAO.getMyBatisHandler(false);
		rd = ss.selectOne("kr.co.sist.elysian.admin.room.roomDetail",roomId);
		mbDAO.closeHandler(ss);
		return rd;
		
	}//selectRoomDetail
	
	
}
