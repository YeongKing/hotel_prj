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
	
	
	
	/**
	 * qna리스트 호출 메서드
	 * @return qna리스트
	 */
	public List<QnaListDomain> searchQnaList(){
		List<QnaListDomain> list = null;
		try {
			list =qDAO.selectQnaList();
		}catch(PersistenceException pe){
			pe.printStackTrace();
			
		}//end catch
		return list;
	}//searchQnaList
		
	
	
	
	/**
	 * qna 세부정보 검색메서드
	 * @param qnaNum qna번호
	 * @return qna도메인
	 */
	public QnaDomain searchQnaDetail(String qnaNum){
		QnaDomain qd = null;
		try {
			qd =qDAO.selectQnaDetail(qnaNum);
		}catch(PersistenceException pe){
			pe.printStackTrace();
			
		}//end catch
		return qd;

	}//searchQnaDetail
	
	
	/**
	 * qna 수정 메서드
	 * @param qVO qnaVO
	 * @return 성공 실패 유무
	 */
	public boolean updateQna(QnaVO qVO){
		
		try {
			int result =qDAO.updateQna(qVO);
			return result>0;
		}catch(PersistenceException pe){
			pe.printStackTrace();
			return false;
		}//end catch
	}//updateQna
	
	
	
	
	
	/**
	 * 공지사항번호 호출 메서드
	 * @return 공지사항번호
	 */
	public String selectQnaNum(){
		String result = "";
		
		try {
			 result =qDAO.selectQnaNum();

		}catch(PersistenceException pe){
			pe.printStackTrace();
		}//end catch
		return result;
	}//selectRoomId
	
	
	
	
	/**
	 * qna 등록 메서드
	 * @param qVO qnaVO
	 * @return 성공 실패 유무
	 */
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
