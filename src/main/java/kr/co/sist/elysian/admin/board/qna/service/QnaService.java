package kr.co.sist.elysian.admin.board.qna.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.elysian.admin.board.event.model.domain.EventDomain;
import kr.co.sist.elysian.admin.board.notice.model.domain.NoticeDomain;
import kr.co.sist.elysian.admin.board.qna.model.domain.QnaDomain;
import kr.co.sist.elysian.admin.board.qna.model.domain.QnaListDomain;
import kr.co.sist.elysian.admin.board.qna.repository.QnaDAO;

@Service
public class QnaService {
	

	@Autowired(required = false)
	private QnaDAO qDAO;
	
	public List<QnaListDomain> searchEventList(){
		List<QnaListDomain> list = null;
		try {
			list =qDAO.selectQnaList();
		}catch(PersistenceException pe){
			pe.printStackTrace();
			
		}//end catch
		return list;
	}
		
	
	public QnaDomain searchQnaDetail(String qnaNum){
		QnaDomain qd = null;
		try {
			qd =qDAO.selectQnaDetail(qnaNum);
		}catch(PersistenceException pe){
			pe.printStackTrace();
			
		}//end catch
		return qd;

	}//searchQnaDetail
	
}
