package kr.co.sist.elysian.admin.dining.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.sist.elysian.admin.dining.model.vo.DiningVO;

@Controller("adminDiningController")
@RequestMapping("/admin")
public class DiningController {
	
	@GetMapping("/dining.do")
	public String searchDiningList() {
		return "admin/dining/dining";
	} //searchDiningList


	
	
	
	public String detailDiningInfo(int diningId, Model model) {
		return "";
	}//detailDiningInfo
	
	
	public String addDining(DiningVO dVO) {
		return "";
	}//addDining
	
	
	public String updateDining(int diningId , DiningVO dVO, Model model) {
		return "";
	}//updateDining
	
	
		public String deleteDining(int diningId, Model model) {
			return "";
	}//deleteDining
	
	
	
	
} // class