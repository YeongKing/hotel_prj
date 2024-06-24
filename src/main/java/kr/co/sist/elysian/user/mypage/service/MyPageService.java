package kr.co.sist.elysian.user.mypage.service;

import java.util.List;
import java.util.Map;

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
	
} // class