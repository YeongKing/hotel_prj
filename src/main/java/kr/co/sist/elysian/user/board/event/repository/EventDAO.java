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

	/**
	 * 모든 이벤트 리스트 가져오는 메서드
	 * @param param
	 * @return
	 * @throws PersistenceException
	 */
	public List<EventDomain> selectAllEventLists(Map<String, Object> param) throws PersistenceException{
		List<EventDomain> eDomain = null;
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		eDomain = ss.selectList("kr.co.sist.elysian.member.board.event.allEventList",param);
		mbDAO.closeHandler(ss);
		return eDomain;
	}

	/**
	 * 검색한 이벤트 리스트 가져오는 메서드
	 * @param param
	 * @return
	 */
	public List<EventDomain> selectSearchEventLists(Map<String, Object> param)throws PersistenceException {
		List<EventDomain> eDomain = null;
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		eDomain = ss.selectList("kr.co.sist.elysian.member.board.event.searchEventList",param);
		mbDAO.closeHandler(ss);
		return eDomain;
	}

	/**
	 * 총 이벤트 리스트 갯수 메서드
	 * @return
	 * @throws PersistenceException
	 */
	public int selectEventTotalCount() throws PersistenceException {
		int totalCount = 0;
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		totalCount = ss.selectOne("kr.co.sist.elysian.member.board.event.eventCount");
		return totalCount;
	}
	
	/**
	 * 검색된 이벤트 리스트 갯수 메서드
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public int selectSearchEventTotalCount(Map<String, String> param)throws PersistenceException {
		int totalCount = 0;
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		totalCount = ss.selectOne("kr.co.sist.elysian.member.board.event.searchEventCount",param);
		return totalCount;
	}
	

	

}
