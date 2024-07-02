package kr.co.sist.elysian.admin.board.qna.repository;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sist.elysian.admin.board.qna.model.domain.QnaDomain;
import kr.co.sist.elysian.admin.board.qna.model.domain.QnaListDomain;
import kr.co.sist.elysian.admin.board.qna.model.vo.QnaVO;
import kr.co.sist.elysian.common.dao.MyBatisDAO;

@Repository
public class QnaDAO {

	@Autowired(required = false)
	private MyBatisDAO mbDAO;
	
	public List<QnaListDomain> selectQnaList() throws PersistenceException{
		
		List<QnaListDomain> list = null;
		
		SqlSession ss= mbDAO.getMyBatisHandler(false);
		list = ss.selectList("kr.co.sist.elysian.admin.board.qna.selectQnaList");
		mbDAO.closeHandler(ss);
		return list;
		
	}//selectQnaList
	
	public QnaDomain selectQnaDetail(String qnaNum) throws PersistenceException{
		
		QnaDomain qd = null;
		
		SqlSession ss= mbDAO.getMyBatisHandler(false);
		qd = ss.selectOne("kr.co.sist.elysian.admin.board.qna.selectQnaDetail",qnaNum);
		mbDAO.closeHandler(ss);
		return qd;
		
	}//selectQnaDetail
	
	
	public int updateQna(QnaVO qVO) throws PersistenceException{
		
		SqlSession ss= mbDAO.getMyBatisHandler(true);
		int result = ss.update("kr.co.sist.elysian.admin.board.qna.updateQna",qVO);
		mbDAO.closeHandler(ss);
		return result;
		
	}//updateQna
	
	
	public String selectQnaNum() throws PersistenceException{
		
		SqlSession ss= mbDAO.getMyBatisHandler(false);
		String result = ss.selectOne("kr.co.sist.elysian.admin.board.qna.selectQnaNum");
		mbDAO.closeHandler(ss);
		return result;
		
	}//selectQnaNum
	
	
	public int insertQna(QnaVO qVO) throws PersistenceException{
		
		SqlSession ss= mbDAO.getMyBatisHandler(true);
		int result = ss.insert("kr.co.sist.elysian.admin.board.qna.insertQna",qVO);
		mbDAO.closeHandler(ss);
		return result;
		
	}//insertQna
	
	
	
	
}
