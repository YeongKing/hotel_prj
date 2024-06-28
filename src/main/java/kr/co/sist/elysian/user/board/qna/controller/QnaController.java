package kr.co.sist.elysian.user.board.qna.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.sist.elysian.user.board.qna.model.domain.QnaDomain;
import kr.co.sist.elysian.user.board.qna.model.vo.QnaVO;
import kr.co.sist.elysian.user.board.qna.service.QnaService;

@Controller("userQnaController")
@RequestMapping("/user")
public class QnaController {
	
	
	@Autowired(required = false)
	private QnaService qs;
	
	
	
	
	
	@GetMapping("/qna.do")
	public String selectQnaList(@ModelAttribute QnaVO qVO,
            Model model) {
		if(qVO.getSearchCtgry()!=null) {
			qVO.setSearchCtgry( (qVO.getSearchCtgry()).substring(0, 3));
		}
		
		if(qVO.getPage()==0) {
			qVO.setPage(1);
		}
		
		System.out.println("============================================================================");
		System.out.println("============================================================================");
		System.out.println(qVO.getSearchCtgry());
		System.out.println("page : "+qVO.getPage()+"/// searchCtgry : " + qVO.getSearchCtgry() + "/// searchDataValue :" + qVO.getSearchDataValue());
		System.out.println("============================================================================");
		System.out.println("============================================================================");
		
		List<QnaDomain> list = qs.selectQnaList(qVO);
		int page = qs.selectPage(qVO);
		System.out.println("totalPage  : "+ page);
		
		model.addAttribute("qnaList",list);
		model.addAttribute("qVO",qVO);
		model.addAttribute("totalPage",page);

		
		return "user/board/qna";
		
	} // selectQnaList

} // class