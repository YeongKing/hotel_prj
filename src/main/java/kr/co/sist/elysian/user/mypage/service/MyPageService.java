package kr.co.sist.elysian.user.mypage.service;

import java.security.SecureRandom;
import java.util.HashMap;
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

import kr.co.sist.elysian.user.login.model.domain.UserDomain;
import kr.co.sist.elysian.user.login.model.vo.UserVO;
import kr.co.sist.elysian.user.mypage.model.domain.DiningResDomain;
import kr.co.sist.elysian.user.mypage.model.domain.MemberDomain;
import kr.co.sist.elysian.user.mypage.model.domain.NationalDomain;
import kr.co.sist.elysian.user.mypage.model.domain.RoomResDomain;
import kr.co.sist.elysian.user.mypage.model.vo.MemberVO;
import kr.co.sist.elysian.user.mypage.repository.MyPageDAO;
//import net.nurigo.sdk.NurigoApp;
//import net.nurigo.sdk.message.model.Message;
//import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
//import net.nurigo.sdk.message.response.SingleMessageSentResponse;
//import net.nurigo.sdk.message.service.DefaultMessageService;

@Service
@PropertySource("classpath:auth.properties")
public class MyPageService{

	@Autowired(required = false)
	private MyPageDAO myPageDAO;
	
//	final DefaultMessageService messageService;
	
	public MyPageService(@Value("${api.key}") String key,  @Value("${api.secret.key}") String secretKey) {
		// 반드시 계정 내 등록된 유효한 API 키, API Secret Key를 입력해주셔야 합니다!
//		this.messageService = NurigoApp.INSTANCE.initialize(key, secretKey, "https://api.coolsms.co.kr");
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
	
	/**
	 * DAO에서 가져온 userId의 개인정보를 회원정보수정에 뿌려주기 위해 반환
	 * @param paramMap
	 * @return 개인정보
	 */
	public MemberDomain selectMemberInfo(String userId) {
		MemberDomain memberDomain = null;
		try {
			memberDomain = myPageDAO.selectMemberInfo(userId);
			
			memberDomain.setPassword(null);
			
			String fullPhone = memberDomain.getPhone();
			memberDomain.setFirstPhoneNum(fullPhone.substring(0, fullPhone.indexOf("-")));
			memberDomain.setSecondPhoneNum(fullPhone.substring(fullPhone.indexOf("-")+1, fullPhone.lastIndexOf("-")));
			memberDomain.setLastPhoneNum(fullPhone.substring(fullPhone.lastIndexOf("-")+1));
			
			String fullEmail = memberDomain.getEmail();
			memberDomain.setFirstEmail(fullEmail.substring(0, fullEmail.indexOf("@")));
			memberDomain.setLastEmail(fullEmail.substring(fullEmail.indexOf("@")+1));
			
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		return memberDomain;
	} // selectMemberInfo

	/**
	 * coolsms를 이용하여 휴대폰 인증번호 발송을 위한 service
	 * @param phoneNumber
	 * @return 인증번호6자리, 전송결과
	 */
	public String checkPhoneRequestNum(String phoneNumber) {
		JSONObject jsonObj = new JSONObject();
//		Message message = new Message();
		
		// 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.
//        message.setFrom("01039299258");
//        message.setTo(phoneNumber);
        
        SecureRandom secureRandom = new SecureRandom();
        int randomNum = secureRandom.nextInt((int)Math.pow(10, 6));
        String formattedNum = String.format("%06d", randomNum);
        StringBuilder smsMessage = new StringBuilder();
        smsMessage.append("[Eysian호텔] SMS인증번호는 ").append(formattedNum).append("입니다. 정확히 입력해주세요.");
        
//        message.setText(smsMessage.toString());
        
//        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
//        System.out.println(response);
        
        jsonObj.put("randomNum", formattedNum);
//        jsonObj.put("statusMessage", response.component5());
//        jsonObj.put("statusCode", response.component8());
		
		return jsonObj.toJSONString();
	} // checkPhoneRequestNum
	
	/**
	 * DAO에서 가져온 전체 국가 정보를 반환
	 * @return 전체 국가정보
	 */
	public List<NationalDomain> selectAllNationalInfo() {
		List<NationalDomain> allnationalInfo = null;
		try {
			allnationalInfo = myPageDAO.selectAllNationalInfo();
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		return allnationalInfo;
	} // selectAllNationalInfo
	
	/**
	 * DAO에서 가져온 전체 이메일과 뷰에서 받아온 이메일의 중복을 확인하여 결과를 반환
	 * @param userEmail
	 * @return 중복확인 결과
	 */
	public String checkDupEmail(String userEmail) {
		JSONObject jsonObj = new JSONObject();
		List<MemberDomain> allMemberEmail = myPageDAO.selectAllEmail();
		
		String dupResult = "SUCCESS";
		
		for(MemberDomain memberDomain : allMemberEmail) {
			if(userEmail.equals(memberDomain.getEmail())) {
				dupResult = "FAIL";
				break;
			} // end if
		} // end for
		
		jsonObj.put("dupResult", dupResult);
		
		return jsonObj.toJSONString();
	} // checkDupEmail
	
	/**
	 * DAO에서 가져온 회원 정보 수정 결과를 JSON으로 변환하여 반환
	 * @param paramMap 회원정보
	 * @return result 처리결과
	 */
	public String modifyMemberInfo(MemberVO memberVO) {
		JSONObject jsonObj = new JSONObject();
		String resultCode = "ERROR";
		
		try {
			int result = myPageDAO.updateMemberInfo(memberVO);
			if(result == 1) {
				resultCode = "SUCCESS";
			} // end if
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		jsonObj.put("resultCode", resultCode);
		return jsonObj.toJSONString();
	} // modifyMemberInfo
	
	/**
	 * DAO에서 가져온 로그인한 아이디의 비밀번호와의 일치여부 확인 후
	 * 새로운 비밀번호로 변경 처리
	 * @param paramMap
	 * @return result 처리결과
	 */
	public String modifyMemberPass(Map<String, String> paramMap) {
		JSONObject jsonObj = new JSONObject();
		String resultCode = "ERROR";
		PasswordEncoder pwEncoder = new BCryptPasswordEncoder();
		
		try {
			MemberDomain memberDomain = myPageDAO.selectMemberInfo(paramMap.get("userId"));
			String encryptedPw = memberDomain.getPassword();
			String uncodePass = paramMap.get("curLoginPassword");
			String newPass = paramMap.get("newLoginPassword");
			
			// 입력한 기존 비밀번호와 저장된 비밀번호가 같은지 비교
			boolean matchCurFlag = pwEncoder.matches(uncodePass, encryptedPw);
			
			// 입력한 새 비밀번호와 저장된 비밀번호가 같은지 비교
			boolean matchNewFlag = pwEncoder.matches(newPass, encryptedPw);
			
			if(!matchCurFlag) { // 기존 비번 = 저장된 비번이 아니라면
				resultCode = "NOTCURPASS";
			} else { // 기존 비번 = 저장된 비번이라면
				// 새 비밀번호 = 저장된 비번인지 확인
				if(matchNewFlag) { // 새 비밀번호 = 저장된 비번이라면
					resultCode = "SAMEASCUR";
				} else { // 새 비밀번호 = 저장된 비번이 아니라면
					String cipherNewPass = pwEncoder.encode(newPass);
					paramMap.put("cipherNewPass", cipherNewPass);
					int result = myPageDAO.updateMemberPass(paramMap);
					if(result == 1) {
						resultCode = "SUCCESS";
					} // end if
				} // end else
			} // end else
			
			jsonObj.put("resultCode", resultCode);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		return jsonObj.toJSONString();
	} // modifyMemberPass
	
	/**
	 * DAO에서 가져온 회원 탈퇴 결과를 JSON으로 변환하여 반환
	 * @param userId
	 * @return 처리 결과
	 */
	public String removeMemberInfo(String userId) {
		JSONObject jsonObj = new JSONObject();
		String resultCode = "ERROR";
		
		try {
			int result = myPageDAO.removeMemberInfo(userId);
			if(result == 1) {
				resultCode = "SUCCESS";
			} // end if
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		jsonObj.put("resultCode", resultCode);
		return jsonObj.toJSONString();
	} // removeMemberInfo
	
	////////////////////소셜 로그인 추가//////////////////////
	public MemberDomain selectSocialLogin(String userId) {
		MemberDomain mdm = null;
		try {
			mdm = myPageDAO.selectSocialLogin(userId);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		return mdm;
	}//selectSocialLogin
	
	/**
     * 사용자의 소셜 연동을 해제하는 메소드
     * @param userId 사용자의 ID
     * @param linkedSocial 소셜 타입 (kakao, naver, google 중 하나)
     * @return 처리 결과를 담은 Map 객체
     */
	public Map<String, Object> updateSocialUnlink(String userId, String linkedSocial) {
        Map<String, Object> response = new HashMap<>();
        try {
            UserVO userVO = new UserVO();
            userVO.setUserId(userId);
            userVO.setLinkedSocial(linkedSocial);

            int result = myPageDAO.updateSocialUnlink(userVO);

            if (result > 0) {
                response.put("success", true);
                response.put("message", "연동이 해제되었습니다.");
            } else {
                response.put("success", false);
                response.put("message", "연동 해제에 실패했습니다.");
            }
        } catch (PersistenceException pe) {
            response.put("success", false);
            response.put("message", "오류가 발생했습니다. 관리자에게 문의하세요.");
        }
        return response;
    }
	
} // class