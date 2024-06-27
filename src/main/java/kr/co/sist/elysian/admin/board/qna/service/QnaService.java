package kr.co.sist.elysian.admin.board.qna.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.elysian.admin.board.qna.model.domain.QnaDomain;
import kr.co.sist.elysian.admin.board.qna.model.domain.QnaListDomain;
import kr.co.sist.elysian.admin.board.qna.model.vo.QnaVO;
import kr.co.sist.elysian.admin.board.qna.repository.QnaDAO;

@Service("adminQnaService")
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
	
	public boolean updateQna(QnaVO qVO){
		
		try {
			int result =qDAO.updateQna(qVO);
			return result>0;
		}catch(PersistenceException pe){
			pe.printStackTrace();
			return false;
		}//end catch
	}//updateQna
	
	
	
	
	public String selectQnaNum(){
		String result = "";
		
		try {
			 result =qDAO.selectQnaNum();

		}catch(PersistenceException pe){
			pe.printStackTrace();
		}//end catch
		return result;
	}//selectRoomId
	
	
	
	public boolean insertQna(QnaVO qVO){
		
		try {
			int result =qDAO.insertQna(qVO);
			return result>0;
		}catch(PersistenceException pe){
			pe.printStackTrace();
			return false;
		}//end catch
	}//insertQna
	
	
	
	
	
	
	
	
}
