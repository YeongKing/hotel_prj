package kr.co.sist.elysian.admin.board.qna.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		
}
