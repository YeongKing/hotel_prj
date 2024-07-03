package kr.co.sist.elysian.admin.board.dashboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sist.elysian.admin.board.dashboard.model.domain.DashboardRoomChartDomain;
import kr.co.sist.elysian.admin.board.dashboard.model.domain.DashboardDiningChartDomain;
import kr.co.sist.elysian.admin.board.dashboard.model.domain.DashboardDomain;
import kr.co.sist.elysian.admin.board.dashboard.service.DashboardService;

@Controller("adminDashboardController")
@RequestMapping("/admin")
public class DashboardController {
	
	@Autowired
	DashboardService dashboardService;
	
	/**
	 * 대시보드 상단 데이터 조회 
	 * @return data(dashboardDomain)
	 */
	@ResponseBody
	@GetMapping(value="/dashboardData.do", produces="application/json; charset=UTF-8")
	public DashboardDomain searchDashboardData() {
		DashboardDomain data = dashboardService.selectDashboardData();
		return data;
	}//searchDashboardData
	
	/**
	 * 대시보드 객실 차트 데이터 조회
	 * @return data(dashboardRoomChartDomain)
	 */
	@ResponseBody
	@GetMapping(value="/dashboardRoomChartData.do", produces="application/json; charset=UTF-8")
	public List<DashboardRoomChartDomain> searchDashboardRoomChartData() {
		List<DashboardRoomChartDomain> data = dashboardService.selectRoomRatioOfThisWeek();
		return data;
	} // searchDashboardCheckinChartData
	
	/**
	 * 대시보드 다이닝 차트 데이터 조회
	 * @return data(dashboardDiningChartDomain)
	 */
	@ResponseBody
	@GetMapping(value="/dashboardDiningChartData.do", produces="application/json; charset=UTF-8")
	public List<DashboardDiningChartDomain> searchDashboardDiningChartData() {
		List<DashboardDiningChartDomain> data = dashboardService.selectDiningRatioOfThisWeek();
		return data;
	} // searchDashboardDiningChartData

} // class