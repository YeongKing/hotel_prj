package kr.co.sist.elysian.admin.dining.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("adminDiningController")
@RequestMapping("/admin")
public class DiningController {
	
	@GetMapping("/dining.do")
	public String searchDiningList() {
		return "admin/dining/dining";
	} //searchDiningList


} // class