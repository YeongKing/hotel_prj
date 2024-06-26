package kr.co.sist.elysian.user.mypage.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.sist.elysian.user.mypage.model.domain.DiningResDomain;
import kr.co.sist.elysian.user.mypage.model.domain.MemberDomain;
import kr.co.sist.elysian.user.mypage.model.domain.RoomResDomain;
import kr.co.sist.elysian.user.mypage.repository.MyPageDAO;

@Service
public class MyPageService{

	@Autowired(required = false)
	private MyPageDAO myPageDAO;
	
	/**
	 * DAO에서 가져온 userName을 jsonObj에 담아 반환
	 * @param userId
	 * @return userName
	 */
	public String searchUserName(String userId) {
		JSONObject jsonObj = new JSONObject();
		try {
			String userName = myPageDAO.selectUserName(userId);

			jsonObj.put("userName", userName);
			
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		return jsonObj.toJSONString();
	} // searchUserName
	
	/**
	 * DAO에서 가져온 mainRoomResList를 jsonObj에 담아 반환
	 * @param userId
	 * @return flag, data(mainRoomResList), dataSize를 포함한 jsonObj
	 */
	public String searchMainRoomResList(String userId) {
		JSONObject jsonObj = new JSONObject();
		
		try {
			List<RoomResDomain> mainRoomResList = myPageDAO.selectMainRoomResList(userId);
			jsonObj.put("flag", !mainRoomResList.isEmpty());
			jsonObj.put("dataSize", mainRoomResList.size());
			
			if(!mainRoomResList.isEmpty()) {
				JSONArray jsonArr = new JSONArray();
				JSONObject jsonTemp = null;
				
				for(RoomResDomain rrd : mainRoomResList) {
					jsonTemp = new JSONObject();
					jsonTemp.put("payNum", rrd.getPayNum());
					jsonTemp.put("roomInfo", rrd.getRoomInfo());
					jsonTemp.put("checkIn", rrd.getCheckIn());
					jsonTemp.put("checkOut", rrd.getCheckOut());
					
					jsonArr.add(jsonTemp);
				} // end for
				
				jsonObj.put("data", jsonArr);
			} // end if
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		return jsonObj.toJSONString();
	} // searchMainRoomResList
	
	/**
	 * DAO에서 가져온 roomResList를 반환
	 * @param userId
	 * @param roomResStatus
	 * @return roomResList
	 */
	public List<RoomResDomain> searchRoomResList(Map<String, String> map) {
		List<RoomResDomain> roomResList = null;
		
		try {
			roomResList = myPageDAO.selectRoomResList(map);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		return roomResList;
	} // searchRoomResList
	
	/**
	 * DAO에서 가져온 roomResDetail을 반환
	 * @param payNum
	 * @return roomResDetail
	 */
	public RoomResDomain searchRoomResDetail(String payNum) {
		RoomResDomain roomResDetail = null;
		try {
			roomResDetail = myPageDAO.selectRoomResDetail(payNum);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		return roomResDetail;
	} // searchRoomResDetail
	
	/**
	 * DAO에서 가져온 예약 취소 결과를 json으로 변환하여 반환
	 * @param payNum
	 * @return result(예약 취소 결과)
	 */
	public String modifyRoomResToCancel(String payNum) {
		JSONObject jsonObj = new JSONObject();
		String resultCode = "ERROR";
		
		try {
			int result = myPageDAO.updateRoomResToCancel(payNum);
			if(result == 1) {
				resultCode = "SUCCESS";
			} // end if
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		jsonObj.put("resultCode", resultCode);
		return jsonObj.toJSONString();
	} // modifyRoomResToCancel
	
	/**
	 * DAO에서 가져온 diningResList를 json으로 변환하여 반환
	 * @param userId
	 * @param roomResStatus
	 * @return roomResList
	 */
	public String searchDiningResList(Map<String, String> map) {
		JSONObject jsonObj = new JSONObject();
		
		try {
			List<DiningResDomain> diningResList = myPageDAO.selectDiningResList(map);
			JSONArray jsonArr = new JSONArray();
			JSONObject jsonTemp = null;
			
			for(DiningResDomain diningResDomain : diningResList) {
				jsonTemp = new JSONObject();
				
				switch(diningResDomain.getDiningResStatus()) {
				case "CONFIRMED" : diningResDomain.setDiningResStatus("예약"); break;
				case "COMPLETED" : diningResDomain.setDiningResStatus("이용완료"); break;
				case "CANCELED" : diningResDomain.setDiningResStatus("취소"); break;
				} // end case
				
				jsonTemp.put("payNum", diningResDomain.getPayNum());
				jsonTemp.put("payPrice", diningResDomain.getPayPrice());
				jsonTemp.put("diningResStatus", diningResDomain.getDiningResStatus());
				jsonTemp.put("diningName", diningResDomain.getDiningName());
				jsonTemp.put("visitDate", diningResDomain.getVisitDate());
				jsonTemp.put("visitTime", diningResDomain.getVisitTime());
				jsonTemp.put("visitPeople", diningResDomain.getVisitPeople());
				
				jsonArr.add(jsonTemp);
			} // end for
			
			jsonObj.put("result", jsonArr);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		return jsonObj.toJSONString();
	} // searchDiningResList
	
	/**
	 * DAO에서 가져온 diningResDomain 반환
	 * @param payNum
	 * @return diningResDomain
	 */
	public DiningResDomain searchDiningResDetail(String payNum) {
		DiningResDomain diningResDomain = null;
		try {
			diningResDomain = myPageDAO.selectDiningResDetail(payNum);
			
			switch(diningResDomain.getDiningResStatus()) {
			case "CONFIRMED" : diningResDomain.setDiningResStatus("예약"); break;
			case "COMPLETED" : diningResDomain.setDiningResStatus("이용완료"); break;
			case "CANCELED" : diningResDomain.setDiningResStatus("취소"); break;
			} // end case
			
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		return diningResDomain;
	} // searchRoomResDetail
	
	/**
	 * DAO에서 가져온 다이닝 예약 방문자 정보 수정 결과를 JSON으로 변환하여 반환
	 * @param paramMap (예약 방문자 정보)
	 * @return result(처리여부)
	 */
	public String modifyDiningVisitorInfo(Map<String, Object> paramMap) {
		JSONObject jsonObj = new JSONObject();
		String resultCode = "ERROR";
		
		try {
			int result = myPageDAO.updateDiningVisitorInfo(paramMap);
			if(result == 1) {
				resultCode = "SUCCESS";
			} // end if
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		jsonObj.put("resultCode", resultCode);
		return jsonObj.toJSONString();
	} // modifyDiningVisitorInfo
	
	/**
	 * DAO에서 가져온 다이닝 예약 취소 결과를 json으로 변환하여 반환
	 * @param payNum
	 * @return result(다이닝 예약 취소 결과)
	 */
	public String modifyDiningResToCancel(String payNum) {
		JSONObject jsonObj = new JSONObject();
		String resultCode = "ERROR";
		
		try {
			int result = myPageDAO.updateDiningResToCancel(payNum);
			if(result == 1) {
				resultCode = "SUCCESS";
			} // end if
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		jsonObj.put("resultCode", resultCode);
		return jsonObj.toJSONString();
	} // modifyDiningResToCancel
	
	/**
	 * DAO에서 가져온 DB의 비밀번호와 입력한 비밀번호의 일치 여부를 json으로 변환하여 반환
	 * @param paramMap (id, 비밀번호)
	 * @return result(비밀번호 일치여부)
	 */
	public String selectMemberPw(Map<String, String> paramMap) {
		JSONObject jsonObj = new JSONObject();
		String result = "FAIL";
		PasswordEncoder pwEncoder = new BCryptPasswordEncoder();
		
		try {
			MemberDomain memberDomain = myPageDAO.selectMemberInfo(paramMap.get("userId"));
			String encryptedPw = memberDomain.getPassword();
			String uncodePass = paramMap.get("inputPw");
			boolean matchFlag = pwEncoder.matches(uncodePass, encryptedPw);
			
			if(matchFlag) {
				result = "SUCCESS";
			} // end if
			
			jsonObj.put("result", result);
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		return jsonObj.toJSONString();
	} // selectMemberPw
	
} // class