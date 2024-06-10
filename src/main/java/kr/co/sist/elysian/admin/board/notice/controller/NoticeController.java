package kr.co.sist.elysian.admin.board.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("adminNoticeController")
@RequestMapping("/admin")
public class NoticeController {
	
	@GetMapping("/notice.do")
	public String searchNoticeList() {
		return "admin/board/notice/notice";
	} //searchNoticeList


} // class