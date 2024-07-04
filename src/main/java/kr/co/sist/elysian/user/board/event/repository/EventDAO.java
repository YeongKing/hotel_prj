package kr.co.sist.elysian.user.board.event.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sist.elysian.common.dao.MyBatisDAO;
import kr.co.sist.elysian.user.board.event.model.domain.EventDomain;

@Repository("userEventDAO")
public class EventDAO {

	@Autowired(required = false)
	private MyBatisDAO mbDAO;

	
	public List<EventDomain> selectAllEventLists(Map<String, Integer> param) throws PersistenceException{
		List<EventDomain> eDomain = null;
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		eDomain = ss.selectList("kr.co.sist.elysian.member.board.event.allEventList",param);
		mbDAO.closeHandler(ss);
		return eDomain;
		
	}

	public int selectEventTotalCount() throws PersistenceException {
		int totalCount = 0;
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		totalCount = ss.selectOne("kr.co.sist.elysian.member.board.event.eventCount");
		return totalCount;
	}

	

}
