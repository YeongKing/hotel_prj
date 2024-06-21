package kr.co.sist.elysian.admin.reservation.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sist.elysian.admin.reservation.model.domain.DiningResDomain;
import kr.co.sist.elysian.admin.reservation.model.domain.RoomInfoDomain;
import kr.co.sist.elysian.admin.reservation.model.domain.RoomResDomain;
import kr.co.sist.elysian.common.dao.MyBatisDAO;

@Repository
public class ResDAO {
	
	@Autowired(required = false)
	private MyBatisDAO myBatisDAO;
	
	/**
	 * MyBatis와 매핑하여 객실 예약 리스트를 조회
	 * @return roomResList
	 * @throws PersistenceException
	 */
	public List<RoomResDomain> selectRoomResList() throws PersistenceException {
		List<RoomResDomain> roomResList = null;
		
		SqlSession ss = myBatisDAO.getMyBatisHandler(false);
		roomResList = ss.selectList("kr.co.sist.elysian.admin.res.roomResList");
		myBatisDAO.closeHandler(ss);
		
		return roomResList;
	} // selectRoomResList
	
	/**
	 * 예약번호(결제번호) 클릭 시 해당 예약의 정보를 조회
	 * @param payNum
	 * @return roomResDomain
	 * @throws PersistenceException
	 */
	public RoomResDomain selectOneRoomRes(String payNum) throws PersistenceException {
		RoomResDomain roomResDomain = null;
		
		SqlSession ss = myBatisDAO.getMyBatisHandler(false);
		roomResDomain = ss.selectOne("kr.co.sist.elysian.admin.res.roomResDetail", payNum);
		myBatisDAO.closeHandler(ss);
		
		return roomResDomain;
	} // selectOneRoomRes
	
	/**
	 * 해당 예약의 체크인일자, 체크아웃일자 기간 동안 예약 가능한 객실과 정보 조회
	 * @param paramMap(체크인일자, 체크아웃일자)
	 * @return roomInfoList
	 * @throws PersistenceException
	 */
	public List<RoomInfoDomain> selectRoomInfoList(Map<String, String> paramMap) throws PersistenceException {
		List<RoomInfoDomain> roomInfoList = null;
		
		SqlSession ss = myBatisDAO.getMyBatisHandler(false);
		roomInfoList = ss.selectList("kr.co.sist.elysian.admin.res.roomInfoList", paramMap);
		myBatisDAO.closeHandler(ss);
		
		return roomInfoList;
	} // selectRoomInfo
	
	/**
	 * 예약 정보 수정 처리
	 * @param roomResVO(예약 정보 VO, 세션 아이디)
	 * @return result(처리 여부)
	 * @throws PersistenceException
	 */
	public int updateRoomRes(Map<String, Object> paramMap) throws PersistenceException {
		int result = 0;
		
		SqlSession ss = myBatisDAO.getMyBatisHandler(true);
		result = ss.update("kr.co.sist.elysian.admin.res.updateRoomRes", paramMap);
		myBatisDAO.closeHandler(ss);
		
		return result;
	} // updateRoomRes
	
	/**
	 * 체크인 처리
	 * @param paramMap(예약 번호, 세션 아이디)
	 * @return result(처리 여부)
	 * @throws PersistenceException
	 */
	public int updateRoomResToCheckin(Map<String, String> paramMap) throws PersistenceException {
		int result = 0;
		
		SqlSession ss = myBatisDAO.getMyBatisHandler(true);
		result = ss.update("kr.co.sist.elysian.admin.res.checkin", paramMap);
		myBatisDAO.closeHandler(ss);
		
		return result;
	} // updateRoomResToCheckin
	
	/**
	 * 체크아웃 처리
	 * @param paramMap(예약 번호, 세션 아이디)
	 * @return result(처리 여부)
	 * @throws PersistenceException
	 */
	public int updateRoomResToCheckout(Map<String, String> paramMap) throws PersistenceException {
		int result = 0;
		
		SqlSession ss = myBatisDAO.getMyBatisHandler(true);
		result = ss.update("kr.co.sist.elysian.admin.res.checkout", paramMap);
		myBatisDAO.closeHandler(ss);
		
		return result;
	} // updateRoomResToCheckout
	
	/**
	 * 예약 취소 처리
	 * @param paramMap(예약 번호, 세션 아이디)
	 * @return result(처리 여부)
	 * @throws PersistenceException
	 */
	public int updateRoomResToCancel(Map<String, String> paramMap) throws PersistenceException {
		int result = 0;
		
		SqlSession ss = myBatisDAO.getMyBatisHandler(true);
		result = ss.update("kr.co.sist.elysian.admin.res.cancelRoomRes", paramMap);
		myBatisDAO.closeHandler(ss);
		
		return result;
	} // updateRoomResToCancel
	
	/**
	 * MyBatis와 매핑하여 다이닝 예약 리스트를 조회
	 * @return diningResList
	 * @throws PersistenceException
	 */
	public List<DiningResDomain> selectDiningResList() throws PersistenceException {
		List<DiningResDomain> diningResList = null;
		
		SqlSession ss = myBatisDAO.getMyBatisHandler(false);
		diningResList = ss.selectList("kr.co.sist.elysian.admin.res.diningResList");
		myBatisDAO.closeHandler(ss);
		
		return diningResList;
	} // selectDiningResList
	
	/**
	 * 예약번호(결제번호) 클릭 시 해당 예약의 정보를 조회
	 * @param payNum
	 * @return diningResDomain
	 * @throws PersistenceException
	 */
	public DiningResDomain selectOneDiningRes(String payNum) throws PersistenceException {
		DiningResDomain diningResDomain = null;
		
		SqlSession ss = myBatisDAO.getMyBatisHandler(false);
		diningResDomain = ss.selectOne("kr.co.sist.elysian.admin.res.diningResDetail", payNum);
		myBatisDAO.closeHandler(ss);
		
		return diningResDomain;
	} // selectOneDiningRes
	
	/**
	 * 예약 정보 수정 처리
	 * @param diningResVO(예약 정보 VO, 세션 아이디)
	 * @return result(처리 여부)
	 * @throws PersistenceException
	 */
	public int updateDiningRes(Map<String, Object> paramMap) throws PersistenceException {
		int result = 0;
		
		SqlSession ss = myBatisDAO.getMyBatisHandler(true);
		result = ss.update("kr.co.sist.elysian.admin.res.updateDiningRes", paramMap);
		myBatisDAO.closeHandler(ss);
		
		return result;
	} // updateDiningRes
	
	/**
	 * 이용 완료 처리
	 * @param paramMap(예약 번호, 세션 아이디)
	 * @return result(처리 여부)
	 * @throws PersistenceException
	 */
	public int updateDiningResToComplete(Map<String, String> paramMap) throws PersistenceException {
		int result = 0;
		
		SqlSession ss = myBatisDAO.getMyBatisHandler(true);
		result = ss.update("kr.co.sist.elysian.admin.res.completeDiningRes", paramMap);
		myBatisDAO.closeHandler(ss);
		
		return result;
	} // updateDiningResToComplete
	
	/**
	 * 예약 취소 처리
	 * @param paramMap(예약 번호, 세션 아이디)
	 * @return result(처리 여부)
	 * @throws PersistenceException
	 */
	public int updateDiningResToCancel(Map<String, String> paramMap) throws PersistenceException {
		int result = 0;
		
		SqlSession ss = myBatisDAO.getMyBatisHandler(true);
		result = ss.update("kr.co.sist.elysian.admin.res.cancelDiningRes", paramMap);
		myBatisDAO.closeHandler(ss);
		
		return result;
	} // updateDiningResToCancel

} // class