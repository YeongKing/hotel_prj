package kr.co.sist.elysian.admin.board.qna.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.sist.elysian.admin.board.qna.model.vo.QnaVO;

@Controller("adminQnaController")
@RequestMapping("/admin")
public class QnaController {
	
	@GetMapping("/qna.do")
	public String searchQnaList() {
		return "admin/board/qna/qna";
	}//mappingRoomResve


	
	
	
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