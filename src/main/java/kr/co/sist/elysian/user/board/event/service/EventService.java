package kr.co.sist.elysian.user.board.event.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.elysian.user.board.event.model.domain.EventDomain;
import kr.co.sist.elysian.user.board.event.repository.EventDAO;


@Service("userEventService")
public class EventService{

	@Autowired
	private EventDAO eventDAO;
	
	/**
	 * 이벤트 리스트 가져오는 메서드
	 * @param page
	 * @param size
	 * @return
	 */
    public List<EventDomain> searchAllEventLists(int page, int size) {
        int offset = (page - 1) * size;
        
        //Mapper에 넣을 Parameter 값 map안에 넣어서 전달
        Map<String, Integer> param = new HashMap<String, Integer>();
        param.put("offset", offset);
        param.put("size", size);
        
        List<EventDomain> eDomain = null;
        try {
        	eDomain = eventDAO.selectAllEventLists(param);
            eDomain = formatEventDates(eDomain);
        }catch(PersistenceException pe) {
        	pe.printStackTrace();
        }
        return eDomain;
    }
    
    private List<EventDomain> formatEventDates(List<EventDomain> events) {
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
        List<EventDomain> formattedEvents = new ArrayList<>();

        for (EventDomain event : events) {
            try {
                if (event.getEventStartDate() != null) {
                    Date startDate = inputFormat.parse(event.getEventStartDate());
                    event.setEventStartDate(outputFormat.format(startDate));
                }
                if (event.getEventEndDate() != null) {
                    Date endDate = inputFormat.parse(event.getEventEndDate());
                    event.setEventEndDate(outputFormat.format(endDate));
                }
            } catch (ParseException e) {
                e.printStackTrace();
            }
            formattedEvents.add(event);
        }

        return formattedEvents;
    }

    //이벤트 갯수 구하는 메서드
    public int getTotalCount() {
    	int totalCount = 0;
    	try {
    		totalCount = eventDAO.selectEventTotalCount();
    	}catch(PersistenceException pe) {
    		pe.printStackTrace();
    	}
        return totalCount;
    }
	
}
