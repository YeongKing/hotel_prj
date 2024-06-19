package kr.co.sist.elysian.admin.board.event.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.elysian.admin.board.event.model.domain.EventDomain;
import kr.co.sist.elysian.admin.board.event.model.domain.EventListDomain;
import kr.co.sist.elysian.admin.board.event.repository.EventDAO;
import kr.co.sist.elysian.admin.member.model.domain.MemberDomain;

@Service
public class EventService {

	
	@Autowired(required = false)
	private EventDAO eDAO;
	
	public List<EventListDomain> searchEventList(){
		List<EventListDomain> list = null;
		try {
			list =eDAO.selectEventList();
		}catch(PersistenceException pe){
			pe.printStackTrace();
			
		}//end catch
		return list;
		
		
	}//searchEventList
	
	
	
	public EventDomain searchEventDetail(String eventNum){
		EventDomain ed = null;
		try {
			ed =eDAO.selectEventDetail(eventNum);
		}catch(PersistenceException pe){
			pe.printStackTrace();
			
		}//end catch
		return ed;

	}//searchEventDetail
	
	
	
	
}
