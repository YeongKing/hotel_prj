package kr.co.sist.elysian.admin.board.notice.controller;

import java.util.HashMap;
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

import kr.co.sist.elysian.admin.board.notice.model.domain.NoticeDomain;
import kr.co.sist.elysian.admin.board.notice.model.domain.NoticeListDomain;
import kr.co.sist.elysian.admin.board.notice.model.vo.NoticeVO;
import kr.co.sist.elysian.admin.board.notice.service.NoticeService;


@Controller("adminNoticeController")
@RequestMapping("/admin")
public class NoticeController {
	@Autowired(required = false)
	private NoticeService ns;
	
	
	/**
	 * 공지사항 탭 진입시 공지사항 리스트 호출
	 * @param model
	 * @return
	 */
	@GetMapping("/notice.do")
	public String selectNoticeList(Model model) {
		List<NoticeListDomain> list = ns.selectNoticeList();
		model.addAttribute("noticeList",list);
		
		
		
		return "admin/board/notice/notice";
	} //searchNoticeList
	
	
	/**
	 * 공지사항 클릭시 상세보기
	 * @param requestData
	 * @param model
	 * @return
	 */
	@ResponseBody
	@PostMapping(value="/noticeDetail.do", produces="application/json; charset=UTF-8")
	public NoticeDomain selectNoticeDetail(@RequestBody Map<String, Object> requestData, Model model) {
		 String noticeNum = (String) requestData.get("noticeNum");
	     NoticeDomain nd = ns.selectNoticeDetail(noticeNum);

		return nd;
	}//selectNoticeDetail
	
	
	
	
	/**
	 * 공지사항 수정
	 * @param nVO
	 * @return
	 */
	@ResponseBody
	@PostMapping(value="/updateNotice.do", produces="application/json; charset=UTF-8")
	public Boolean updateNotice(@RequestBody NoticeVO nVO) {

	     boolean result = ns.updateNotice(nVO);
	     
	     
		return result;
	}//updateNotice
	

	
	
	/**
	 * 공지사항 등록 모달창이 열리면 noticeNum의 가장 마지막 + 1 반환
	 * @return
	 */
	@ResponseBody
	@PostMapping(value="/selectNoticeNum.do", produces="application/json; charset=UTF-8")
	public Map<String, String> selectNoticeNum() {
	    String result = ns.selectNoticeNum();
	    Map<String, String> response = new HashMap<String, String>();
	    response.put("noticeNum", result);
	    return response;
	}//selectNoticeNum
	
	
	/**
	 * 공지사항 게시글 등록
	 * @param nVO
	 * @return
	 */
	@ResponseBody
	@PostMapping(value="/insertNotice.do", produces="application/json; charset=UTF-8")
	public boolean insertNotice(@RequestBody NoticeVO nVO) {
//		System.out.println(nVO);
	    boolean result = ns.insertNotice(nVO);
	    
		return result;
	}//insertNotice
	
	
} // class