package kr.co.sist.elysian.admin.board.qna.repository;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sist.elysian.admin.board.event.model.domain.EventDomain;
import kr.co.sist.elysian.admin.board.qna.model.domain.QnaDomain;
import kr.co.sist.elysian.admin.board.qna.model.domain.QnaListDomain;
import kr.co.sist.elysian.common.dao.MyBatisDAO;

@Repository
public class QnaDAO {

	@Autowired(required = false)
	private MyBatisDAO mbDAO;
	
	public List<QnaListDomain> selectQnaList() throws PersistenceException{
		
		List<QnaListDomain> list = null;
		
		SqlSession ss= mbDAO.getMyBatisHandler(false);
		list = ss.selectList("kr.co.sist.elysian.admin.board.qna.qnaList");
		mbDAO.closeHandler(ss);
		return list;
		
	}//selectQnaList
	
	public QnaDomain selectQnaDetail(String qnaNum) throws PersistenceException{
		
		QnaDomain qd = null;
		
		SqlSession ss= mbDAO.getMyBatisHandler(false);
		qd = ss.selectOne("kr.co.sist.elysian.admin.board.qna.qnaDetail",qnaNum);
		mbDAO.closeHandler(ss);
		return qd;
		
	}//selectQnaDetail
	
	
}
