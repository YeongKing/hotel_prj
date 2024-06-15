package kr.co.sist.elysian.admin.board.qna.controller;

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

import kr.co.sist.elysian.admin.board.notice.model.domain.NoticeDomain;
import kr.co.sist.elysian.admin.board.qna.model.domain.QnaDomain;
import kr.co.sist.elysian.admin.board.qna.model.domain.QnaListDomain;
import kr.co.sist.elysian.admin.board.qna.model.vo.QnaVO;
import kr.co.sist.elysian.admin.board.qna.service.QnaService;

@Controller("adminQnaController")
@RequestMapping("/admin")
public class QnaController {
	
	@Autowired(required = false)
	private QnaService qs;
	
	@GetMapping("/qna.do")
	public String searchQnaList(Model model) {
		List<QnaListDomain> list = qs.searchEventList();
		model.addAttribute("qnaList",list);
		
		
		return "admin/board/qna/qna";
	}//mappingRoomResve


	@ResponseBody
	@PostMapping(value="/qnaDetail.do", produces="application/json; charset=UTF-8")
	public QnaDomain selectQnaDetail(@RequestBody Map<String, Object> requestData, Model model) {
		 String qnaNum = (String) requestData.get("qnaNum");
	     QnaDomain qd = qs.searchQnaDetail(qnaNum);

		return qd;
	}//selectNoticeDetail
	
	
	
	
	public String addFrm() {
		return "";
	}//addFrm

	public String frmProcess(QnaVO qVO) {
		return "";
	}//frmProcess

	public String detailQna(int qnaNum , Model model) {
		return "";
	}//detailQna

	public String modifyQna(QnaVO qVO , Model model) {
		return "";
	}//modifyQna

	public String removeQna(int qnaNum , Model model) {
		return "";
	}//removeQna

	
	
	public String logout(SessionStatus ss) {
		return "";
	}//logout

			
	
	
	
	
} // class