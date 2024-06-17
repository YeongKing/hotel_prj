package kr.co.sist.elysian.admin.board.notice.controller;

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
import org.springframework.web.bind.support.SessionStatus;

import kr.co.sist.elysian.admin.board.event.model.domain.EventDomain;
import kr.co.sist.elysian.admin.board.notice.model.domain.NoticeDomain;
import kr.co.sist.elysian.admin.board.notice.model.domain.NoticeListDomain;
import kr.co.sist.elysian.admin.board.notice.model.vo.NoticeVO;
import kr.co.sist.elysian.admin.board.notice.repository.NoticeDAO;


@Controller("adminNoticeController")
@RequestMapping("/admin")
public class NoticeController {
	@Autowired(required = false)
	private NoticeDAO nDAO;
	
	
	@GetMapping("/notice.do")
	public String selectNoticeList(Model model) {
		List<NoticeListDomain> list = nDAO.selectNoticeList();
		model.addAttribute("noticeList",list);
		
		
		
		return "admin/board/notice/notice";
	} //searchNoticeList
	
	
	@ResponseBody
	@PostMapping(value="/noticeDetail.do", produces="application/json; charset=UTF-8")
	public NoticeDomain selectNoticeDetail(@RequestBody Map<String, Object> requestData, Model model) {
		 String noticeNum = (String) requestData.get("noticeNum");
	     NoticeDomain nd = nDAO.selectNoticeDetail(noticeNum);

		return nd;
	}//selectNoticeDetail
	
	

	
	
	public String addNotice() {
		return "";
	}//addNotice
	
	
	public String frmProcess(NoticeVO nVO) {
		return "";
	}//frmProcess
	
	
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