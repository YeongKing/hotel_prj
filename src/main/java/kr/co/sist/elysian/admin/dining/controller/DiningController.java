package kr.co.sist.elysian.admin.dining.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sist.elysian.admin.dining.model.domain.DiningDomain;
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
		List<DiningListDomain> list = ds.searchDiningList();
		model.addAttribute("diningList",list);
		

		
		return "admin/dining/dining";
	} //searchDiningList


	
	@ResponseBody
	@PostMapping(value="/diningDetail.do", produces="application/json; charset=UTF-8")
	public DiningDomain selectDiningDetail(@RequestBody Map<String, Object> requestData, Model model) {
		 String diningId = (String) requestData.get("diningId");
	     DiningDomain dd = ds.searchDiningDetail(diningId);

		return dd;
	}//selectDiningDetail
	
	
	
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