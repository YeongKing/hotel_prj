package kr.co.sist.elysian.user.board.qna.repository;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sist.elysian.common.dao.MyBatisDAO;
import kr.co.sist.elysian.user.board.qna.model.domain.QnaDomain;
import kr.co.sist.elysian.user.board.qna.model.vo.QnaVO;

@Repository("memberQnaDAO")
public class QnaDAO {

	@Autowired(required = false)
	private MyBatisDAO mbDAO;
	
	/**
	 * 
	 * qna 리스트 검색 메서드
	 * @param qVO qnaVO
	 * @return qna도메인 리스트
	 * @throws PersistenceException
	 */
	public List<QnaDomain> selectQnaList(QnaVO qVO) throws PersistenceException{
		
		List<QnaDomain> list = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("kr.co.sist.elysian.member.board.qna.selectQnaList",qVO);
		mbDAO.closeHandler(ss);
		return list;
		
		
		
	}//selectQnaList
	
	
	
	
	
	/**
	 * 페이지 선택 메서드
	 * @param qVO qnaVO
	 * @return 페이지 번호
	 * @throws PersistenceException
	 */
	public int selectPage(QnaVO qVO) throws PersistenceException{
		
		int page = 0;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		
		page = ss.selectOne("kr.co.sist.elysian.member.board.qna.selectPage",qVO);
		    
		mbDAO.closeHandler(ss);
		return page;
		
		
		
	}//selectPage
	
	
	
}
