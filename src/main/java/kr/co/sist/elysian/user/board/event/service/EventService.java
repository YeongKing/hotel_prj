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

import kotlinx.serialization.descriptors.StructureKind.MAP;
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
    public List<EventDomain> searchAllEventLists(int page, int size,String searchText) {
        int offset = (page - 1) * size;
        
        //Mapper에 넣을 Parameter 값 map안에 넣어서 전달
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("offset", offset);
        param.put("size", size);
        param.put("searchText", searchText);
        
        List<EventDomain> eDomain = null;
        try {
        	eDomain = eventDAO.selectAllEventLists(param);
            eDomain = formatEventDates(eDomain);
        }catch(PersistenceException pe) {
        	pe.printStackTrace();
        }
        return eDomain;
    }
    


    /**
     * 검색한 이벤트 리스트 구하는 메서드
     * @param page
     * @param size
     * @param startDate
     * @param endDate
     * @return
     */
	public List<EventDomain> searchKeywordEventLists(int page, int size, String startDate, String endDate, String searchText) {
        int offset = (page - 1) * size;
        
        //Mapper에 넣을 Parameter 값 map안에 넣어서 전달
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("offset", offset);
        param.put("size", size);
        param.put("startDate", startDate);
        param.put("endDate", endDate);
        param.put("searchText",searchText);
        List<EventDomain> eDomain = null;
        try {
        	eDomain = eventDAO.selectSearchEventLists(param);
            eDomain = formatEventDates(eDomain);
        }catch(PersistenceException pe) {
        	pe.printStackTrace();
        }
        return eDomain;
	}
	
    /**
     * 이벤트 갯수 구하는 메서드
     * @return
     */
    public int getTotalCount() {
    	int totalCount = 0;
    	try {
    		totalCount = eventDAO.selectEventTotalCount();
    	}catch(PersistenceException pe) {
    		pe.printStackTrace();
    	}
        return totalCount;
    }
    
	/**
	 * 검색한 이벤트 갯수 구하는 메서드
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public int getSearchTotalCount(String startDate, String endDate) {
    	int totalCount = 0;
    	Map<String, String> param = new HashMap<String, String>();
    	param.put("startDate", startDate);
    	param.put("endDate", endDate);
    	
    	try {
    		totalCount = eventDAO.selectSearchEventTotalCount(param);
    	}catch(PersistenceException pe) {
    		pe.printStackTrace();
    	}
        return totalCount;
    }
	
	//날짜포매팅 메서드
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


    /**
     * 이벤트 상세 정보 가져오는 메서드
     * @param eventNum
     * @return
     */
	public EventDomain searchEventDetail(String eventNum) {
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		EventDomain eDomain = null;
		try {
			eDomain = eventDAO.selectEventDetail(eventNum);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		try {
			if (eDomain.getEventStartDate() != null) {
                Date startDate = inputFormat.parse(eDomain.getEventStartDate());
                eDomain.setEventStartDate(outputFormat.format(startDate));
            }
            if (eDomain.getEventEndDate() != null) {
                Date endDate = inputFormat.parse(eDomain.getEventEndDate());
                eDomain.setEventEndDate(outputFormat.format(endDate));
            }
		}catch(ParseException e) {
			e.printStackTrace();
		}
		
		return eDomain;
	}



	public List<EventDomain> selectSugEvent() {
        List<EventDomain> eDomain = null;
        try {
        	eDomain = eventDAO.selectSugEventLists();
            eDomain = formatEventDates(eDomain);
        }catch(PersistenceException pe) {
        	pe.printStackTrace();
        }
        return eDomain;
	}
}
	
