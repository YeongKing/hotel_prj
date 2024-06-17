package kr.co.sist.elysian.admin.reservation.repository;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sist.elysian.admin.reservation.model.domain.DiningResDomain;
import kr.co.sist.elysian.admin.reservation.model.domain.RoomResDomain;
import kr.co.sist.elysian.common.dao.MyBatisDAO;

@Repository
public class ResDAO {
	
	@Autowired(required = false)
	private MyBatisDAO myBatisDAO;
	
	/**
	 * MyBatis와 매핑하여 객실 예약 리스트를 조회
	 * @return roomResList
	 * @throws PersistenceException
	 */
	public List<RoomResDomain> selectRoomResList() throws PersistenceException {
		List<RoomResDomain> roomResList = null;
		
		SqlSession ss = myBatisDAO.getMyBatisHandler(false);
		roomResList = ss.selectList("kr.co.sist.elysian.admin.res.roomResList");
		myBatisDAO.closeHandler(ss);
		
		return roomResList;
	} // selectRoomResList
	
	/**
	 * MyBatis와 매핑하여 다이닝 예약 리스트를 조회
	 * @return diningResList
	 * @throws PersistenceException
	 */
	public List<DiningResDomain> selectDiningResList() throws PersistenceException {
		List<DiningResDomain> diningResList = null;
		
		SqlSession ss = myBatisDAO.getMyBatisHandler(false);
		diningResList = ss.selectList("kr.co.sist.elysian.admin.res.diningResList");
		myBatisDAO.closeHandler(ss);
		
		return diningResList;
	} // selectDiningResList

} // class