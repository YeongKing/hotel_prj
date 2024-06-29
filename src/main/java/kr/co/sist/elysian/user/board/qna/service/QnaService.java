package kr.co.sist.elysian.user.board.qna.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.elysian.user.board.qna.model.domain.QnaDomain;
import kr.co.sist.elysian.user.board.qna.model.vo.QnaVO;
import kr.co.sist.elysian.user.board.qna.repository.QnaDAO;

@Service("memberQnaService")
public class QnaService{

	@Autowired(required = false)
	private QnaDAO qdao;
	
	public List<QnaDomain> selectQnaList(QnaVO qVO){
		List<QnaDomain> list = null;
		
		try {
			list = qdao.selectQnaList(qVO);
			
			
		}catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		
		
		
		
		
		return list;
		
		
	}//selectQnaList
	
	public int selectPage(QnaVO qVO){
		int page = 0;
		
		try {
			page = qdao.selectPage(qVO);
			
			
		}catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		
		
		
		
		
		return page;
		
		
	}//selectPage
	
	
}//class
