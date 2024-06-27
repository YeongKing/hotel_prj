package kr.co.sist.elysian.user.mypage.service;

import java.security.SecureRandom;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.sist.elysian.user.mypage.model.domain.DiningResDomain;
import kr.co.sist.elysian.user.mypage.model.domain.MemberDomain;
import kr.co.sist.elysian.user.mypage.model.domain.RoomResDomain;
import kr.co.sist.elysian.user.mypage.repository.MyPageDAO;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Service
@PropertySource("classpath:auth.properties")
public class MyPageService{

	@Autowired(required = false)
	private MyPageDAO myPageDAO;
	
	final DefaultMessageService messageService;
	
	public MyPageService(@Value("${api.key}") String key,  @Value("${api.secret.key}") String secretKey) {
		// 반드시 계정 내 등록된 유효한 API 키, API Secret Key를 입력해주셔야 합니다!
		this.messageService = NurigoApp.INSTANCE.initialize(key, secretKey, "https://api.coolsms.co.kr");
	} // MyPageService

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
	
	//public String selectMemberInfo(Map<String, String> paramMap) {
		
	//}

	public String checkPhoneRequestNum(String phoneNumber) {
		JSONObject jsonObj = new JSONObject();
		Message message = new Message();
		
		// 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.
        message.setFrom("01039299258");
        message.setTo(phoneNumber);
        
        SecureRandom secureRandom = new SecureRandom();
        int randomNum = secureRandom.nextInt((int)Math.pow(10, 6));
        StringBuilder smsMessage = new StringBuilder();
        smsMessage.append("[Eysian호텔] SMS인증번호는 ").append(randomNum).append("입니다. 정확히 입력해주세요.");
        
        message.setText(smsMessage.toString());
        
        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
        System.out.println(response);
        
        jsonObj.put("randomNum", randomNum);
        jsonObj.put("statusMessage", response.component5());
        jsonObj.put("statusCode", response.component8());
		
		return jsonObj.toJSONString();
	} // checkPhoneRequestNum
	
} // class