package kr.co.sist.elysian.user.board.qna.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("userQnaController")
@RequestMapping("/user")
public class QnaController {
	
	@GetMapping("/qna.do")
	public String searchQnaList() {
		
		return "user/board/qna";
		
	} // searchQnaList

} // class