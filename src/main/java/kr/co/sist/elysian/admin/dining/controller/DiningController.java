package kr.co.sist.elysian.admin.dining.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.sist.elysian.admin.dining.model.domain.DiningListDomain;
import kr.co.sist.elysian.admin.dining.model.vo.DiningVO;
import kr.co.sist.elysian.admin.dining.service.DiningService;

@Controller("adminDiningController")
@RequestMapping("/admin")
public class DiningController {
	
	@Autowired(required = false)
	private DiningService ds;
	
	@GetMapping("/dining.do")
	public String searchDiningList(Model model) {
		List<DiningListDomain> list = ds.searchRoomList();
		model.addAttribute("diningList",list);
		

		
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