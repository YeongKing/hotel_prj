package kr.co.sist.elysian.admin.board.qna.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("adminQnaController")
@RequestMapping("/admin")
public class QnaController {
	
	@GetMapping("/qna.do")
	public String searchQnaList() {
		return "admin/board/qna/qna";
	} // mappingRoomResve

} // class