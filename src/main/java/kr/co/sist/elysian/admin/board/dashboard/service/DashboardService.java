package kr.co.sist.elysian.admin.board.dashboard.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.elysian.admin.board.dashboard.model.domain.DashboardRoomChartDomain;
import kr.co.sist.elysian.admin.board.dashboard.model.domain.DashboardDiningChartDomain;
import kr.co.sist.elysian.admin.board.dashboard.model.domain.DashboardDomain;
import kr.co.sist.elysian.admin.board.dashboard.repository.DashboardDAO;

@Service
public class DashboardService {
	
	@Autowired
	DashboardDAO dashboardDAO;
	
	/**
	 * DAO에서 가져온 대시보드 데이터들을 Domain으로 객체화
	 * @return dashboardDomain
	 */
	public DashboardDomain selectDashboardData() {
		DashboardDomain dashboardDomain = null;
		
		try {
			int todayRoomResCnt = dashboardDAO.selectTodayRoomResCnt();
			int oneMonthRoomResCnt = dashboardDAO.selectOneMonthRoomResCnt();
			int allMemberCnt = dashboardDAO.selectAllMemberCnt();
			int todayJoinCnt = dashboardDAO.selectTodayJoinCnt();
			int expectedCheckinCnt = dashboardDAO.selectExpectedCheckinCnt();
			int checkinCnt = dashboardDAO.selectCheckinCnt();
			int expectedCheckoutCnt = dashboardDAO.selectExpectedCheckoutCnt();
			int checkoutCnt = dashboardDAO.selectCheckOutCnt();
			
			dashboardDomain = DashboardDomain.builder()
											.todayRoomResCnt(todayRoomResCnt)
											.oneMonthRoomResCnt(oneMonthRoomResCnt)
											.allMemberCnt(allMemberCnt)
											.todayJoinCnt(todayJoinCnt)
											.expectedCheckinCnt(expectedCheckinCnt)
											.checkinCnt(checkinCnt)
											.expectedCheckoutCnt(expectedCheckoutCnt)
											.checkoutCnt(checkoutCnt)
											.build();
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		return dashboardDomain;
	} // selectDashboardData
	
	/**
	 * @return  이번주 체크인, 체크아웃 현황
	 */
	public List<DashboardRoomChartDomain> selectRoomRatioOfThisWeek() {
		List<DashboardRoomChartDomain> roomRatioOfThisWeek = null;
		
		try {
			roomRatioOfThisWeek = dashboardDAO.selectRoomRatioOfThisWeek();
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		return roomRatioOfThisWeek;
	} // selectRoomRatioOfThisWeek

	/**
	 * @return  이번주 예약, 취소 현황
	 */
	public List<DashboardDiningChartDomain> selectDiningRatioOfThisWeek() {
		List<DashboardDiningChartDomain> diningRatioOfThisWeek = null;
		
		try {
			diningRatioOfThisWeek = dashboardDAO.selectDiningRatioOfThisWeek();
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		return diningRatioOfThisWeek;
	} // selectDiningRatioOfThisWeek

} // class