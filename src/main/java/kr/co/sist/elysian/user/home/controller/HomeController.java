package kr.co.sist.elysian.user.home.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.sist.elysian.user.home.model.HomeDomain;
import kr.co.sist.elysian.user.home.service.HomeService;
@Controller("userHomeController")
@RequestMapping("/user")
public class HomeController {
	
	@Autowired
	HomeService homeService;
	
	/**
	 * 메인페이지 매핑
	 * @param model(최근 등록된 이벤트 6개 정보)
	 * @return 메인페이지 jsp view
	 */
	@RequestMapping(value="/index.do",method= {GET,POST})
	public String main(Model model) {
		
		List<HomeDomain> homeEventList = homeService.selectHomeEvent();
		model.addAttribute("homeEventlist", homeEventList);
		
		return "user/index";
	}// main

	
	
	
	
	
	
} // class