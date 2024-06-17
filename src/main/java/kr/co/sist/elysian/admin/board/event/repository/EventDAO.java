package kr.co.sist.elysian.admin.board.event.repository;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sist.elysian.admin.board.event.model.domain.EventDomain;
import kr.co.sist.elysian.admin.board.event.model.domain.EventListDomain;
import kr.co.sist.elysian.admin.member.model.domain.MemberDomain;
import kr.co.sist.elysian.common.dao.MyBatisDAO;

@Repository
public class EventDAO {
	
	@Autowired(required = false)
	private MyBatisDAO mbDAO;
	
	public List<EventListDomain> selectEventList() throws PersistenceException{
		
		List<EventListDomain> list = null;
		
		SqlSession ss= mbDAO.getMyBatisHandler(false);
		list = ss.selectList("kr.co.sist.elysian.admin.board.event.eventList");
		mbDAO.closeHandler(ss);
		return list;
		
	}//selectEventList
	
	public EventDomain selectEventDetail(String eventNum) throws PersistenceException{
		
		EventDomain ed = null;
		
		SqlSession ss= mbDAO.getMyBatisHandler(false);
		ed = ss.selectOne("kr.co.sist.elysian.admin.board.event.eventDetail",eventNum);
		mbDAO.closeHandler(ss);
		return ed;
		
	}//selectEventDetail
	

}
