package kr.co.sist.elysian.user.dining.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.elysian.user.dining.model.domain.DiningDomain;
import kr.co.sist.elysian.user.dining.model.domain.DiningOptionDomain;
import kr.co.sist.elysian.user.dining.model.vo.DiningResVO;
import kr.co.sist.elysian.user.dining.model.vo.DiningSeatsVO;
import kr.co.sist.elysian.user.dining.repository.DiningDAO;

@Service("userDiningService")
public class DiningService {

	@Autowired(required = false)
	private DiningDAO userDiningDAO;

	/**
	 * 화면접속시 랜덤한 다이닝 정보 가져오기
	 * @return
	 */
	public DiningDomain searchRandomDiningDetail() {
		DiningDomain dDomain = null;
		try {
			dDomain = userDiningDAO.selectRandomDiningDetail();
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		return dDomain;
	}//searchRandomDiningDetail
	
	

	/**
	 * 모든 다이닝의 이름과 아이디를 가져오는 메서드
	 * @return
	 */
	public List<DiningOptionDomain> searchAllDiningName() {
		List<DiningOptionDomain> dOptionDomain = null;
		try {
			dOptionDomain = userDiningDAO.selectAllDiningName();
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}

		return dOptionDomain;
	}//searchAllDiningName
	
	

	/**
	 * select된 다이닝의 상세정보를 가져오는 메서드
	 * @param diningId
	 * @return
	 */
	public DiningDomain searchOneDiningDetail(String diningId) {
		DiningDomain dDomain = null;
		try {
			dDomain = userDiningDAO.selectOneDiningDetail(diningId);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}

		return dDomain;
	}//searchOneDiningDetail
	
	

	/**
	 * step1의 초기화면 로드를 위해 데이터를 가져오는 메서드 
	 * 해당시간, 인원, 날짜에 좌석이 있는 유무를 판단한다.
	 * @param diningId
	 * @param date
	 * @param table
	 * @param personCnt
	 * @return
	 */
	public Map<String, Object> setDiningData(String diningId, LocalDate date, String table,int personCnt) {
		
        Map<String, Object> model = new HashMap<>();
        DiningDomain dDomain = userDiningDAO.selectOneDiningDetail(diningId);
		// 리스트에 30분단위로 저장
		List<String> timeSlots1 = new ArrayList<String>();
		List<String> timeSlots2 = new ArrayList<String>();
		List<String> timeSlots3 = new ArrayList<String>();
		
		String openTime = dDomain.getOpenTime();
		String closeTime = dDomain.getCloseTime();
		
		model.put("openTime", openTime);
		model.put("closeTime", closeTime);
		model.put("dDomain", dDomain);
		// 시작 시간 분리
		int openHour = Integer.parseInt(openTime.split(":")[0]);
		int openMinute = Integer.parseInt(openTime.split(":")[1]);
		// 종료 시간 분리
		int closeHour = Integer.parseInt(closeTime.split(":")[0]);
		int closeMinute = Integer.parseInt(closeTime.split(":")[1]);

		// 2부 시간 시작
		int part2OpenHour = 15;
		int part2OpenMinute = 00;

		// 2부 시간 종료
		int part2CloseHour = 19;
		int part2CloseMinute = 00;

		// 현재 시간 설정
		int currentHour = openHour;
		int currentMinute = openMinute;

		// 1부 시간 리스트에 저장
		while (currentHour < part2OpenHour || (currentHour == part2OpenHour && currentMinute <= part2OpenMinute)) {
			timeSlots1.add(String.format("%02d:%02d", currentHour, currentMinute));
			// 30분 추가
			currentMinute += 30;
			// 분영역이 60이상이면 시간을 증가시킨다
			if (currentMinute >= 60) {
				currentHour += 1;
				currentMinute -= 60;
			}
		}

		// 2부 시간 리스트에 저장
		while (currentHour < part2CloseHour || (currentHour == part2CloseHour && currentMinute <= part2CloseMinute)) {
			timeSlots2.add(String.format("%02d:%02d", currentHour, currentMinute));
			// 30분 추가
			currentMinute += 30;
			// 분영역이 60이상이면 시간을 증가시킨다
			if (currentMinute >= 60) {
				currentHour += 1;
				currentMinute -= 60;
			}
		}

		// 3부 시간 리스트에 저장
		while (currentHour < closeHour || (currentHour == closeHour && currentMinute <= closeMinute)) {
			timeSlots3.add(String.format("%02d:%02d", currentHour, currentMinute));
			// 30분 추가
			currentMinute += 30;
			// 분영역이 60이상이면 시간을 증가시킨다
			if (currentMinute >= 60) {
				currentHour += 1;
				currentMinute -= 60;
			}
		}
	     model.put("timeSlots1", timeSlots1);
	     model.put("timeSlots2", timeSlots2);
	     model.put("timeSlots3", timeSlots3);
	     
         Map<String, Integer> partSeatMap = new HashMap<>();
         partSeatMap.put("partOneSeat", getSeatCountForPart(diningId, date, table,1));
         partSeatMap.put("partTwoSeat", getSeatCountForPart(diningId, date, table,2));
         partSeatMap.put("partThreeSeat", getSeatCountForPart(diningId, date, table,3));
         model.put("partSeatMap", partSeatMap);
         
         //인원수에 따른 필요 테이블수 반환
     	int requiredTables  = (int) Math.ceil(personCnt / 4.0);
     	model.put("requiredTables", requiredTables);
        
     	return model;
	}//setDiningData
	
	
	
	
	/**
	 * 해당 시간대, 인원 ,날짜에 대한 남은 좌석수를 가져오는 메서드
	 * @param diningId
	 * @param date
	 * @param table
	 * @param part
	 * @return
	 */
    private int getSeatCountForPart(String diningId,LocalDate date, String table, int part) {
    	 Map<String, Object> paramMap = new HashMap<>();
         paramMap.put("diningId", diningId);
         paramMap.put("date", date);
         paramMap.put("table", table);
         paramMap.put("part", part);
     
         return userDiningDAO.selectDiningSeatCnt(paramMap);
    }//getSeatCountForPart
    
    
    
    /**
     * 유저정보 찾는 메서드
     * @param userId
     * @return
     */
	public DiningResVO searchUserName(String userId) {
		DiningResVO dResVO = null;
		try {
			dResVO = userDiningDAO.searchUserName(userId);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		return dResVO;
	}//searchUserName

	
	/**
	 * 예약 등록 메서드
	 * @param drVO
	 * @return
	 */
	public String saveDiningReservation(DiningResVO drVO) {
		String resResult = "";
		int diningId = 0;
		try {
			diningId = userDiningDAO.insertDiningReservation(drVO);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		if(diningId == 0) {
			resResult = "등록에 실패하였습니다 다시 시도해주세요.";
		}else {
			resResult = "등록에 성공하였습니다 감사합니다.";
		}
		
		return resResult;
	}//saveDiningReservation
	
	
	/**
	 * 예약 유효성 검사 메서드
	 * @param dsVO
	 * @return
	 */
	public int reserveValid(DiningSeatsVO dsVO) {
		int resultDining = 0;
		boolean result = false;
		try {
			result = userDiningDAO.reserveValid(dsVO);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		if(result == false) {
			resultDining = 0;
		}else {
			resultDining = 1;
		}
		
		
		return resultDining;
	}//reserveValid
	


}
