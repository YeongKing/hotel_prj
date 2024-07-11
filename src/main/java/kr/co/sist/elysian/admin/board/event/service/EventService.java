package kr.co.sist.elysian.admin.board.event.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.elysian.admin.board.event.model.domain.EventDomain;
import kr.co.sist.elysian.admin.board.event.model.domain.EventListDomain;
import kr.co.sist.elysian.admin.board.event.model.vo.EventVO;
import kr.co.sist.elysian.admin.board.event.repository.EventDAO;

@Service
public class EventService {

	
	@Autowired(required = false)
	private EventDAO eDAO;
	
	/**
	 * 이벤트 목록 조회 메서드
	 * @return
	 */
	public List<EventListDomain> searchEventList(){
		List<EventListDomain> list = null;
		try {
			list =eDAO.selectEventList();
		}catch(PersistenceException pe){
			pe.printStackTrace();
			
		}//end catch
		return list;
		
		
	}//searchEventList
	
	
	/**
	 * 이벤트 상제 조회 메서드
	 * @param eventNum
	 * @return
	 */
	public EventDomain searchEventDetail(String eventNum){
		EventDomain ed = null;
		try {
			ed =eDAO.selectEventDetail(eventNum);
		}catch(PersistenceException pe){
			pe.printStackTrace();
			
		}//end catch
		return ed;

	}//searchEventDetail


	/**
	 * 이벤트 마지막 번호 + 1 메서드
	 * @return
	 */
	public String searchLastEventNum() {
		String nextEventNum = "";
		try {
			String lastEventNum = eDAO.selectLastEventNum();
			//숫자 추출 과정
			String prefix = "EVENT";
			String numberStr = lastEventNum.substring(prefix.length());
			int number = Integer.parseInt(numberStr);
			number++;
			//증가된 숫자 형식에 맞춰 문자열 변환
			nextEventNum = String.format("%s%04d", prefix,number);
			
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return nextEventNum;
	}//searchLastEventNum


	/**
	 * 이벤트 등록 메서드
	 * @param eVO
	 * @return
	 */
	public boolean registerEvent(EventVO eVO) {
		try {
			eDAO.insertEvent(eVO);
			return true;
		}catch(PersistenceException pe) {
			pe.printStackTrace();
			return false;
		}
	}//registerEvent

	/**
	 * 이벤트 수정 메서드
	 * @param param
	 * @return
	 */
	public boolean modifyEvent(HashMap<String, Object> param) {
		try {
			eDAO.updateEvent(param);
			return true;
		}catch(PersistenceException pe) {
			pe.printStackTrace();
			return false;
		}
	}//modifyEvent

	
	
}
