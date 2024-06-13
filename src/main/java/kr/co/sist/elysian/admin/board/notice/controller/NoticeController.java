package kr.co.sist.elysian.admin.board.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.sist.elysian.admin.board.notice.model.domain.NoticeListDomain;
import kr.co.sist.elysian.admin.board.notice.model.vo.NoticeVO;
import kr.co.sist.elysian.admin.board.notice.repository.NoticeDAO;


@Controller("adminNoticeController")
@RequestMapping("/admin")
public class NoticeController {
	@Autowired(required = false)
	private NoticeDAO nd;
	
	
	@GetMapping("/notice.do")
	public String searchNoticeList(Model model) {
		List<NoticeListDomain> list = nd.selectNoticeList();
		model.addAttribute("noticeList",list);
		
		
		
		return "admin/board/notice/notice";
	} //searchNoticeList

	
	
	public String addNotice() {
		return "";
	}//addNotice
	
	
	public String frmProcess(NoticeVO nVO) {
		return "";
	}//frmProcess
	
	
	public String detailNotice(int noticeNum ,Model model) {
		return "";
	}//detailNotice
	
	
	public String modifyNotice(NoticeVO nVO ,Model model) {
		return "";
	}//modifyNotice
	
	
	public String removeNotice(int noticeNum ,Model model) {
		return "";
	}//removeNotice
	
	
	public String logout(SessionStatus ss) {
		return "";
	}//logout
	
	
} // class