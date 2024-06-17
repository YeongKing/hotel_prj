package kr.co.sist.elysian.admin.reservation.repository;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sist.elysian.admin.reservation.model.domain.RoomResDomain;
import kr.co.sist.elysian.common.dao.MyBatisDAO;

@Repository
public class ResDAO {
	
	@Autowired(required = false)
	private MyBatisDAO myBatisDAO;
	
	public List<RoomResDomain> selectRoomResList() throws PersistenceException {
		List<RoomResDomain> roomResList = null;
		
		SqlSession ss = myBatisDAO.getMyBatisHandler(false);
		roomResList = ss.selectList("kr.co.sist.elysian.admin.res.roomResList");
		myBatisDAO.closeHandler(ss);
		
		return roomResList;
	} // selectRoomResList

} // class