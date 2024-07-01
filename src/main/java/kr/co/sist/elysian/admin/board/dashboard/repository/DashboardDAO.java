package kr.co.sist.elysian.admin.board.dashboard.repository;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sist.elysian.admin.board.dashboard.model.domain.DashboardDiningChartDomain;
import kr.co.sist.elysian.admin.board.dashboard.model.domain.DashboardRoomChartDomain;
import kr.co.sist.elysian.common.dao.MyBatisDAO;

@Repository
public class DashboardDAO {
	
	@Autowired
	MyBatisDAO myBatisDAO;
	
	/**
	 * @return 오늘 객실 예약 건수
	 */
	public int selectTodayRoomResCnt() throws PersistenceException {
		SqlSession ss = myBatisDAO.getMyBatisHandler(false);
		int todayRoomResCnt = ss.selectOne("kr.co.sist.elysian.admin.dashboard.selectTodayRoomResCnt");
		return todayRoomResCnt;
	} // selectTodayRoomResCnt

	/**
	 * @return 이번 달 객실 예약 건수
	 */
	public int selectOneMonthRoomResCnt() throws PersistenceException {
		SqlSession ss = myBatisDAO.getMyBatisHandler(false);
		int oneMonthRoomResCnt = ss.selectOne("kr.co.sist.elysian.admin.dashboard.selectOneMonthRoomResCnt");
		return oneMonthRoomResCnt;
	} // selectOneMonthRoomResCnt
	
	/**
	 * @return 총 회원 수
	 */
	public int selectAllMemberCnt() throws PersistenceException {
		SqlSession ss = myBatisDAO.getMyBatisHandler(false);
		int allMemberCnt = ss.selectOne("kr.co.sist.elysian.admin.dashboard.selectAllMemberCnt");
		return allMemberCnt;
	} // selectAllMemberCnt
	
	/**
	 * @return 오늘 회원가입 수
	 */
	public int selectTodayJoinCnt() throws PersistenceException {
		SqlSession ss = myBatisDAO.getMyBatisHandler(false);
		int todayJoinCnt = ss.selectOne("kr.co.sist.elysian.admin.dashboard.selectTodayJoinCnt");
		return todayJoinCnt;
	} // selectTodayJoinCnt
	
	/**
	 * @return 오늘 체크인 예정 건수
	 */
	public int selectExpectedCheckinCnt() throws PersistenceException {
		SqlSession ss = myBatisDAO.getMyBatisHandler(false);
		int expectedCheckinCnt = ss.selectOne("kr.co.sist.elysian.admin.dashboard.selectExpectedCheckinCnt");
		return expectedCheckinCnt;
	} // selectExpectedCheckinCnt
	
	/**
	 * @return 오늘 체크인 완료 건수
	 */
	public int selectCheckinCnt() throws PersistenceException {
		SqlSession ss = myBatisDAO.getMyBatisHandler(false);
		int checkinCnt = ss.selectOne("kr.co.sist.elysian.admin.dashboard.selectCheckinCnt");
		return checkinCnt;
	} // selectCheckinCnt
	
	/**
	 * @return 오늘 체크아웃 예정 건수
	 */
	public int selectExpectedCheckoutCnt() throws PersistenceException {
		SqlSession ss = myBatisDAO.getMyBatisHandler(false);
		int expectedCheckoutCnt = ss.selectOne("kr.co.sist.elysian.admin.dashboard.selectExpectedCheckoutCnt");
		return expectedCheckoutCnt;
	} // selectExpectedCheckoutCnt

	/**
	 * @return 오늘 체크인 완료 건수
	 */
	public int selectCheckOutCnt() throws PersistenceException {
		SqlSession ss = myBatisDAO.getMyBatisHandler(false);
		int checkoutCnt = ss.selectOne("kr.co.sist.elysian.admin.dashboard.selectCheckOutCnt");
		return checkoutCnt;
	} // selectCheckOutCnt
	
	/**
	 * @return 이번주 체크인, 체크아웃 현황
	 * @throws PersistenceException
	 */
	public List<DashboardRoomChartDomain> selectRoomRatioOfThisWeek() throws PersistenceException {
		SqlSession ss = myBatisDAO.getMyBatisHandler(false);
		List<DashboardRoomChartDomain> roomRatioOfThisWeek = ss.selectList("kr.co.sist.elysian.admin.dashboard.selectRoomChartData");
		return roomRatioOfThisWeek;
	} // selectRoomRatioOfThisWeek
	
	/**
	 * @return 이번주 다이닝 예약, 취소 현황
	 * @throws PersistenceException
	 */
	public List<DashboardDiningChartDomain> selectDiningRatioOfThisWeek() throws PersistenceException {
		SqlSession ss = myBatisDAO.getMyBatisHandler(false);
		List<DashboardDiningChartDomain> diningRatioOfThisWeek = ss.selectList("kr.co.sist.elysian.admin.dashboard.selectDiningChartData");
		return diningRatioOfThisWeek;
	} // selectDiningRatioOfThisWeek
	
} // class