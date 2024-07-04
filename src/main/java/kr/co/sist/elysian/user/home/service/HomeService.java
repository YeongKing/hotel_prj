package kr.co.sist.elysian.user.home.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.elysian.user.home.model.HomeDomain;
import kr.co.sist.elysian.user.home.repository.HomeDAO;

@Service
public class HomeService {
	
	@Autowired
	private HomeDAO homeDAO;
	private final String uploadPath = "http://localhost/hotel_prj/util/event_img/";
	
	/**
	 * DAO에서 셀렉해온 최근 이벤트 리스트 6개를 전달
	 * @return 최근 이벤트 리스트 6개
	 */
	public List<HomeDomain> selectHomeEvent() {
		
		List<HomeDomain> homeEventList = null;
		
		try {
			homeEventList = homeDAO.selectHomeEvent();
			
			String eventFullPath = "img_event.jpg";
			
			for(HomeDomain homeEvent : homeEventList) {
				eventFullPath = uploadPath + homeEvent.getEventMainImg();
				homeEvent.setEventImgFullPath(eventFullPath);
				System.out.println("homeEvent : ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★" + "\n"+homeEvent);
			} // end for
			
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		return homeEventList;	
	} // selectHomeEvent

} // class