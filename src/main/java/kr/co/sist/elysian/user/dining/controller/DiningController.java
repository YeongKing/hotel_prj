package kr.co.sist.elysian.user.dining.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("userDiningController")
@RequestMapping("/user")
public class DiningController {

	@GetMapping("/dining.do")
	public String searchAllDiningList() {
		
		return "user/resve/dining/step0";
		
	} // searchAllDiningList

} // class