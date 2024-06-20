package kr.co.sist.elysian.user.dining.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.sist.elysian.user.dining.model.domain.DiningDomain;
import kr.co.sist.elysian.user.dining.service.DiningService;

@Controller("userDiningController")
@RequestMapping("/user")
public class DiningController {

	@Autowired(required = false)
	private DiningService userDiningService;
	
	//화면접속시 랜덤한 다이닝 정보 가져오기 다이닝
	@GetMapping("/dining.do")
	@ResponseBody
	public String searchAllDiningList(Model model) {
		
		ObjectMapper mapper = new ObjectMapper();
		DiningDomain dDomian = userDiningService.searchRandomDiningDetail();
		
		try {
			String diningJson = mapper.writeValueAsString(dDomian);
			model.addAttribute("diningJson",diningJson);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "user/resve/dining/step0";
		
	} // searchAllDiningList
	
	@GetMapping("/dining_step0.do")
	public String diningBookingStep0() {
		return "user/resve/dining/step1";
		
	} // diningBookingStep0
	
	@PostMapping("/dining_step1.do")
	public String diningBookingStep1() {
		return "user/resve/dining/step2";
		
	} // diningBookingStep1
	
	

} // class