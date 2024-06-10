package kr.co.sist.elysian.admin.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("adminMemberController")
@RequestMapping("/admin")
public class MemberController {
	
	@GetMapping("/member.do")
	public String searcMemberList() {
		return "admin/member/member";
	} //searcMemberList

} // class