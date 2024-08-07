package kr.co.sist.elysian.admin.member.controller;

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



import kr.co.sist.elysian.admin.member.model.domain.MemberDomain;
import kr.co.sist.elysian.admin.member.model.domain.MemberListDomain;
import kr.co.sist.elysian.admin.member.model.vo.MemberVO;
import kr.co.sist.elysian.admin.member.service.MemberService;

@Controller("adminMemberController")
@RequestMapping("/admin")
public class MemberController {
	
	@Autowired(required = false)
	private MemberService ms;
	

	
	
	@GetMapping("/member.do")
	public String searchMemberList(Model model) {
		List<MemberListDomain> list = ms.searchMemberList();
		model.addAttribute("memberList",list);
		
		
		return "admin/member/member";
	}//searchMemberList
	
	@ResponseBody
	@PostMapping(value="/memberDetail.do", produces="application/json; charset=UTF-8")
	public MemberDomain selectMemberDetail(@RequestBody Map<String, Object> requestData) {
		 String memberId = (String) requestData.get("memberId");
	     MemberDomain md = ms.searchMemberDetail(memberId);
	     
		return md;
	}//selectMemberDetail
	
	
	
	
	@ResponseBody
	@PostMapping(value="/deleteMember.do", produces="application/json; charset=UTF-8")
	public Boolean deleteMember(@RequestBody Map<String, Object> requestData) {
		 String memberId = (String) requestData.get("memberId");
	     boolean result = ms.deleteMember(memberId);
	     
	     
		return result;
	}//deleteMember
	
	@ResponseBody
	@PostMapping(value="/updateMember.do", produces="application/json; charset=UTF-8")
	public Boolean updateMember(@RequestBody MemberVO mVO) {

	     boolean result = ms.updateMember(mVO);
	     
	     
		return result;
	}//updateMember
	
	

	

	
	
	
	
} // class