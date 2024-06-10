package kr.co.sist.elysian.admin.board.dashboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

@Controller("adminDashboardController")
@RequestMapping("/admin")
public class DashboardController {
	
	
	public String searchTodayRoomRes(Model model) {
		return "";
	}//searchTodayRoomRes
	
	
	public String searchOneMonthRoomRes(Model model) {
		return "";
	}//searchOneMonthRoomRes
	
	
	public String searchTodayCheckin(Model model) {
		return "";
	}//searchTodayCheckin
	
	
	public String searchTodayCheckout(Model model) {
		return "";
	}//searchTodayCheckout
	
	
	public String searchAllMember(Model model) {
		return "";
	}//searchAllMember
	
	
	public String searchTodayJoin(Model model) {
		return "";
	}//searchTodayJoin
	
	
	public String searchWeeklyCheckin(Model model) {
		return "";
	}//searchWeeklyCheckin
	
	
	public String searchWeeklyCheckout(Model model) {
		return "";
	}//searchWeeklyCheckout
	
	
	public String searchWeeklyDiningRes(Model model) {
		return "";
	}//searchWeeklyDiningRes
	
	
	public String searchWeeklyDiningCancel(Model model) {
		return "";
	}//searchWeeklyDiningCancel
	
	
	public String logout(SessionStatus ss) {
		return "";
	}//logout
	
	
	


} // class