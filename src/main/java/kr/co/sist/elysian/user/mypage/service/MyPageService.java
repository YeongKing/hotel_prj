package kr.co.sist.elysian.user.mypage.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	} // 
	
} // class