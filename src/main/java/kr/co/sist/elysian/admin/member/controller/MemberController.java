package kr.co.sist.elysian.admin.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.sist.elysian.admin.member.model.domain.MemberListDomain;
import kr.co.sist.elysian.admin.member.model.vo.MemberVO;
import kr.co.sist.elysian.admin.member.model.vo.SearchVO;
import kr.co.sist.elysian.admin.member.service.MemberService;

@Controller("adminMemberController")
@RequestMapping("/admin")
public class MemberController {
	
	@Autowired(required = false)
	private MemberService ms;
	
	
	@GetMapping("/member.do")
	public String searcMemberList(Model model) {
		List<MemberListDomain> list = ms.searchMemberList();
		model.addAttribute("memberList",list);
		
		
		return "admin/member/member";
	}//searcMemberList

	
	
	public String searchMemberList(SearchVO sVO,Model model) {
		return "";
	}//searchMemberList
	
	
	public String addFrm() {
		return "";
	}//addFrm
	
	
	public String frmProcess(MemberVO mVO) {
		return "";
	}//frmProcess
	
	
	public String detailMember(String userId, Model model) {
		return "";
	}//detailMember
	
	
	public String modifyMember(MemberVO mVO, Model model) {
		return "";
	}//modifyMember
	
	
	public String removeMember(String userId, Model model) {
		return "";
	}//removeMember
	
	
	public String logout(SessionStatus ss) {
		return "";
	}//logout
	
	
	
	
	
	
	
	
} // class