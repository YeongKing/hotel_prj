package kr.co.sist.elysian.user.mypage.repository;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sist.elysian.common.dao.MyBatisDAO;
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

} // class