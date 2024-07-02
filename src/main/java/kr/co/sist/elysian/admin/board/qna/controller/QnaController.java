package kr.co.sist.elysian.admin.board.qna.controller;

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
import org.springframework.web.bind.support.SessionStatus;

import kr.co.sist.elysian.admin.board.qna.model.domain.QnaDomain;
import kr.co.sist.elysian.admin.board.qna.model.domain.QnaListDomain;
import kr.co.sist.elysian.admin.board.qna.model.vo.QnaVO;
import kr.co.sist.elysian.admin.board.qna.service.QnaService;

@Controller("adminQnaController")
@RequestMapping("/admin")
public class QnaController {
	
	@Autowired(required = false)
	private QnaService qs;
	
	/**
	 * qna탭 진입시 qna 리스트 호출 메서드
	 * @param model 
	 * @return
	 */
	@GetMapping("/qna.do")
	public String searchQnaList(Model model) {
		List<QnaListDomain> list = qs.searchQnaList();
		model.addAttribute("qnaList",list);
		
		
		return "admin/board/qna/qna";
	}//searchQnaList


	/**
	 * qna 세부정보 호출 메서드
	 * @param requestData
	 * @param model
	 * @return qna도메인
	 */
	@ResponseBody
	@PostMapping(value="/qnaDetail.do", produces="application/json; charset=UTF-8")
	public QnaDomain selectQnaDetail(@RequestBody Map<String, Object> requestData) {
		 String qnaNum = (String) requestData.get("qnaNum");
	     QnaDomain qd = qs.searchQnaDetail(qnaNum);

		return qd;
	}//selectQnaDetail
	
	
	
	/**
	 * qna 세부사항 변경 메서드
	 * @param qVO qnaVO
	 * @return 성공 실패 유무
	 */
	@ResponseBody
	@PostMapping(value="/updateQna.do", produces="application/json; charset=UTF-8")
	public Boolean updateQna(@RequestBody QnaVO qVO) {

	     boolean result = qs.updateQna(qVO);
	     
	     
		return result;
	}//updateQna
	
	

	/**
	 * 자주 찾는 질문 등록 모달창이 열리면 qnaNum의 가장 마지막 + 1 반환
	 * @return
	 */
	@ResponseBody
	@PostMapping(value="/selectQnaNum.do", produces="application/json; charset=UTF-8")
	public Map<String, String> selectQnaNum() {
	    String result = qs.selectQnaNum();

	    Map<String, String> response = new HashMap<String, String>();
	    response.put("qnaNum", result);
	    return response;
	}//selectQnaNum
	
	
	
	/**
	 * 자주 찾는 질문 게시글 등록
	 * @param qVO qnaVO
	 * @return
	 */
	@ResponseBody
	@PostMapping(value="/insertQna.do", produces="application/json; charset=UTF-8")
	public boolean insertQna(@RequestBody QnaVO qVO) {
		
	    boolean result = qs.insertQna(qVO);
	    
		return result;
	}//insertQna
	

	
} // class