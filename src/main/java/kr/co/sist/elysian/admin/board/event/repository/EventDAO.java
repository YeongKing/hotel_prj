package kr.co.sist.elysian.admin.board.event.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sist.elysian.admin.board.event.model.domain.EventDomain;
import kr.co.sist.elysian.admin.board.event.model.domain.EventListDomain;
import kr.co.sist.elysian.admin.board.event.model.vo.EventVO;
import kr.co.sist.elysian.common.dao.MyBatisDAO;

@Repository
public class EventDAO {
	
	@Autowired(required = false)
	private MyBatisDAO mbDAO;
	
	//DB에서 이벤트 목록 SELECT
	public List<EventListDomain> selectEventList() throws PersistenceException{
		
		List<EventListDomain> list = null;
		
		SqlSession ss= mbDAO.getMyBatisHandler(false);
		list = ss.selectList("kr.co.sist.elysian.admin.board.event.eventList");
		mbDAO.closeHandler(ss);
		return list;
		
	}//selectEventList
	
	//DB에서 이벤트 상세 SELECT
	public EventDomain selectEventDetail(String eventNum) throws PersistenceException{
		
		EventDomain ed = null;
		
		SqlSession ss= mbDAO.getMyBatisHandler(false);
		ed = ss.selectOne("kr.co.sist.elysian.admin.board.event.eventDetail",eventNum);
		mbDAO.closeHandler(ss);
		return ed;
		
	}//selectEventDetail

	//DB에서 EVENT_NUM 마지막 번호 SELECT
	public String selectLastEventNum()throws PersistenceException {
		String lastEventNum = "";
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		lastEventNum = ss.selectOne("kr.co.sist.elysian.admin.board.event.lastEventNum");
		mbDAO.closeHandler(ss);
		return lastEventNum;
	}//selectLastEventNum

	//DB에 이벤트 INSERT
	public void insertEvent(EventVO eVO) {
		SqlSession ss = mbDAO.getMyBatisHandler(true);
		ss.insert("kr.co.sist.elysian.admin.board.event.addEvent",eVO);
		mbDAO.closeHandler(ss);
	}//insertEvent

	//DB에 이벤트 UPDATE
	public void updateEvent(HashMap<String, Object> param) {
		SqlSession ss = mbDAO.getMyBatisHandler(true);
		ss.update("kr.co.sist.elysian.admin.board.event.updateEvent",param);
		mbDAO.closeHandler(ss);
	}//updateEvent

	
	

}
