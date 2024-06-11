package kr.co.sist.elysian.user.board.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("userNoticeController")
@RequestMapping("/user")
public class NoticeController {
	
	@GetMapping("/notice.do")
	public String searchNoticeList() {
		
		return "user/board/notice";
		
	} // searchNoticeList

} // class