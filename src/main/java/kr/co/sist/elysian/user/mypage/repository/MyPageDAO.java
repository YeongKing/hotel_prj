package kr.co.sist.elysian.user.mypage.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sist.elysian.common.dao.MyBatisDAO;
import kr.co.sist.elysian.user.mypage.model.domain.DiningResDomain;
import kr.co.sist.elysian.user.mypage.model.domain.MemberDomain;
import kr.co.sist.elysian.user.mypage.model.domain.NationalDomain;
import kr.co.sist.elysian.user.mypage.model.domain.RoomResDomain;

@Repository
public class MyPageDAO {
	
	@Autowired(required = false)
	private MyBatisDAO myBatisDAO;
	
	/**
	 * MyBatis와 매핑하여 로그인한 아이디의 이름 조회
	 * @param userId
	 * @return userName
	 * @throws PersistenceException
	 */
	public String selectUserName(String userId) throws PersistenceException {
		SqlSession ss = myBatisDAO.getMyBatisHandler(false);
		String userName = ss.selectOne("kr.co.sist.elysian.member.mypage.selectUserName", userId);
		myBatisDAO.closeHandler(ss);
		return userName;
	} // selectUserName
	
	/**
	 * MyBatis와 매핑하여 로그인한 아이디의 마이페이지 메인에 들어갈 예약 내역 조회
	 * @param userId
	 * @return mainRoomResList
	 * @throws PersistenceException
	 */
	public List<RoomResDomain> selectMainRoomResList(String userId) throws PersistenceException {
		SqlSession ss = myBatisDAO.getMyBatisHandler(false);
		List<RoomResDomain> mainRoomResList = ss.selectList("kr.co.sist.elysian.member.mypage.selectMainRoomResList", userId);
		myBatisDAO.closeHandler(ss);
		return mainRoomResList;
	} // selectMainRoomResList
	
	/**
	 * MyBatis와 매핑하여 로그인한 아이디의 마이페이지 객실 예약 내역에 들어갈 예약 내역 조회
	 * @param userId, roomResStatus
	 * @return roomResList
	 * @throws PersistenceException
	 */
	public List<RoomResDomain> selectRoomResList(Map<String, String> map) throws PersistenceException {
		SqlSession ss = myBatisDAO.getMyBatisHandler(false);
		List<RoomResDomain> roomResList = ss.selectList("kr.co.sist.elysian.member.mypage.selectRoomResList", map);
		myBatisDAO.closeHandler(ss);
		return roomResList;
	} // selectRoomResList
	
	/**
	 * MyBatis와 매핑하여 로그인한 아이디의 마이페이지 객실 예약 내역 - 객실 상세조회 시 들어갈 예약 정보 조회
	 * @param payNum
	 * @return roomResDetail
	 * @throws PersistenceException
	 */
	public RoomResDomain selectRoomResDetail(String payNum) throws PersistenceException {
		SqlSession ss = myBatisDAO.getMyBatisHandler(false);
		RoomResDomain roomResDetail = ss.selectOne("kr.co.sist.elysian.member.mypage.selectRoomResDetail", payNum);
		myBatisDAO.closeHandler(ss);
		return roomResDetail;
	} // selectRoomResDetail
	
	/**
	 * MyBatis와 매핑하여 예약 취소 처리
	 * @param payNum
	 * @return result(처리 여부)
	 * @throws PersistenceException
	 */
	public int updateRoomResToCancel(String payNum) throws PersistenceException {
		SqlSession ss = myBatisDAO.getMyBatisHandler(true);
		int result = ss.update("kr.co.sist.elysian.member.mypage.cancelRoomRes", payNum);
		myBatisDAO.closeHandler(ss);
		return result;
	} // updateRoomResToCancel
	
	/**
	 * MyBatis와 매핑하여 로그인한 아이디의 마이페이지 다이닝 예약 내역에 들어갈 예약 내역 조회
	 * @param userId, diningResStatus
	 * @return diningResList
	 * @throws PersistenceException
	 */
	public List<DiningResDomain> selectDiningResList(Map<String, String> map) throws PersistenceException {
		SqlSession ss = myBatisDAO.getMyBatisHandler(false);
		List<DiningResDomain> diningResList = ss.selectList("kr.co.sist.elysian.member.mypage.selectDiningResList", map);
		myBatisDAO.closeHandler(ss);
		return diningResList;
	} // selectDiningResList
	
	/**
	 * MyBatis와 매핑하여 로그인한 아이디의 마이페이지 다이닝 예약 내역 - 다이닝 상세조회 시 들어갈 예약 정보 조회
	 * @param payNum
	 * @return diningResDomain
	 * @throws PersistenceException
	 */
	public DiningResDomain selectDiningResDetail(String payNum) throws PersistenceException {
		SqlSession ss = myBatisDAO.getMyBatisHandler(false);
		DiningResDomain diningResDomain = ss.selectOne("kr.co.sist.elysian.member.mypage.selectDiningResDetail", payNum);
		myBatisDAO.closeHandler(ss);
		return diningResDomain;
	} // selectDiningResDetail
	
	/**
	 * 다이닝 예약 방문자 정보 수정 처리
	 * @param paramMap
	 * @return result(처리 여부)
	 * @throws PersistenceException
	 */
	public int updateDiningVisitorInfo(Map<String, Object> paramMap) throws PersistenceException {
		SqlSession ss = myBatisDAO.getMyBatisHandler(true);
		int result = ss.update("kr.co.sist.elysian.member.mypage.updateDiningVisitorInfo", paramMap);
		myBatisDAO.closeHandler(ss);
		return result;
	} // updateDiningVisitorInfo
	
	/**
	 * MyBatis와 매핑하여 다이닝 예약 취소 처리
	 * @param payNum
	 * @return result(처리 여부)
	 * @throws PersistenceException
	 */
	public int updateDiningResToCancel(String payNum) throws PersistenceException {
		SqlSession ss = myBatisDAO.getMyBatisHandler(true);
		int result = ss.update("kr.co.sist.elysian.member.mypage.cancelDiningRes", payNum);
		myBatisDAO.closeHandler(ss);
		return result;
	} // updateDiningResToCancel
	
	/**
	 * MyBatis와 매핑하여 개인정보관리에 필요한 회원 정보 조회
	 * @param userId
	 * @return memberDomain
	 * @throws PersistenceException
	 */
	public MemberDomain selectMemberInfo(String userId) throws PersistenceException {
		SqlSession ss = myBatisDAO.getMyBatisHandler(false);
		MemberDomain memberDomain = ss.selectOne("kr.co.sist.elysian.member.mypage.selectMemberInfo", userId);
		myBatisDAO.closeHandler(ss);
		return memberDomain;
	} // selectMemberInfo
	
	/**
	 * MyBatis와 매핑하여 전체 국가코드, 국가명 조회
	 * @return allnationalInfo
	 * @throws PersistenceException
	 */
	public List<NationalDomain> selectAllNationlInfo() throws PersistenceException {
		SqlSession ss = myBatisDAO.getMyBatisHandler(false);
		List<NationalDomain> allnationalInfo = ss.selectList("kr.co.sist.elysian.member.mypage.selectAllNationalInfo");
		myBatisDAO.closeHandler(ss);
		return allnationalInfo;
	} // selectAllNationlInfo
	
	/**
	 * MyBatis와 매핑하여 모든 사용자의 이메일을 조회
	 * @return allMemberEmail
	 * @throws PersistenceException
	 */
	public List<MemberDomain> selectAllEmail() throws PersistenceException {
		SqlSession ss = myBatisDAO.getMyBatisHandler(false);
		List<MemberDomain> allMemberEmail = ss.selectList("kr.co.sist.elysian.member.mypage.selectAllEmail");
		myBatisDAO.closeHandler(ss);
		return allMemberEmail;
	}

} // class