package kr.co.sist.elysian.user.room.repository;

import java.util.List;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sist.elysian.user.room.model.domain.MemberDomain;
import kr.co.sist.elysian.user.room.model.domain.RoomListDomain;
import kr.co.sist.elysian.user.room.model.vo.RoomResVO;
import kr.co.sist.elysian.common.dao.MyBatisDAO;

@Repository("userRoomDAO")
public class RoomDAO {

	@Autowired(required = false)
	private MyBatisDAO mbDAO;

	/**
	 * 객실 리스트 검색 메서드
	 * @param rrVO 객실예약 VO
	 * @return 객실리스트 
	 * @throws PersistenceException
	 */
	public List<RoomListDomain> selectRoomList(RoomResVO rrVO) throws PersistenceException {
		List<RoomListDomain> list = null;
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("kr.co.sist.elysian.member.room.roomList", rrVO);
		mbDAO.closeHandler(ss);
		return list;
	}



	/**
	 * 멤버 검색 메서드
	 * @param userId 멤버ID 
	 * @return 멤버도메인
	 * @throws PersistenceException
	 */
	public MemberDomain selectMember(String userId) throws PersistenceException {
		MemberDomain umd = null;
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		umd = ss.selectOne("kr.co.sist.elysian.member.room.memberDetail", userId);
		mbDAO.closeHandler(ss);
		return umd;
	}


	/**
	 * 객실예약 검증 메서드
	 * @param rrVO 객실예약VO
	 * @return 객실번호
	 * @throws PersistenceException
	 */
	public int resveValid(RoomResVO rrVO) throws PersistenceException {
		int roomId ;
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		roomId = ss.selectOne("kr.co.sist.elysian.member.room.resveValid", rrVO);
		mbDAO.closeHandler(ss);
		return roomId;
	}

	/**
	 * 객실예약 등록 메서드
	 * @param rrVO 객실예약VO
	 * @return 1이면 성공
	 * @throws PersistenceException
	 */
	public int insertRoomRes(RoomResVO rrVO) throws PersistenceException{

		SqlSession ss= mbDAO.getMyBatisHandler(true);
		int result = ss.insert("kr.co.sist.elysian.member.room.insertRoomRes",rrVO);
		mbDAO.closeHandler(ss);
		return result;

	}//insertPayInfo



}