package kr.co.sist.elysian.user.dining.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("userDiningController")
@RequestMapping("/user")
public class DiningController {

	@GetMapping("/dining.do")
	public String searchAllDiningList() {
		
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