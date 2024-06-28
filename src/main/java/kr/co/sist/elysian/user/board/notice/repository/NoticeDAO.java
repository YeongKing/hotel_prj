package kr.co.sist.elysian.user.board.notice.repository;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sist.elysian.common.dao.MyBatisDAO;
import kr.co.sist.elysian.user.board.notice.model.domain.NoticeDomain;
import kr.co.sist.elysian.user.board.notice.model.vo.NoticeVO;

@Repository("memberNoticeDAO")
public class NoticeDAO {
	
	@Autowired(required = false)
	private MyBatisDAO mbDAO;
	
	public List<NoticeDomain> selectNoticeList(NoticeVO nVO) throws PersistenceException{
		
		List<NoticeDomain> list = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("kr.co.sist.elysian.member.board.notice.selectNoticeList",nVO);
		mbDAO.closeHandler(ss);
		return list;
		
		
		
	}//selectNoticeList
	
	
	public int selectPage(NoticeVO nVO) throws PersistenceException{
		
		int page = 0;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		
		page = ss.selectOne("kr.co.sist.elysian.member.board.notice.selectPage",nVO);
		    
		mbDAO.closeHandler(ss);
		return page;
		
		
		
	}//selectPage
	
	public NoticeDomain selectNoticeDetail(NoticeVO nVO) throws PersistenceException{
		
		NoticeDomain nd = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		nd = ss.selectOne("kr.co.sist.elysian.member.board.notice.selectNoticeDetail",nVO);
		mbDAO.closeHandler(ss);
		return nd;
		
		
		
	}//selectNoticeDetail
	
	public NoticeDomain selectNextNotice(NoticeVO nVO) throws PersistenceException{
		
		NoticeDomain nd = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		nd = ss.selectOne("kr.co.sist.elysian.member.board.notice.selectNextNotice",nVO);
		mbDAO.closeHandler(ss);
		return nd;
		
		
		
	}//selectNextNotice
	
	public NoticeDomain selectPrevNotice(NoticeVO nVO) throws PersistenceException{
		
		NoticeDomain nd = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		nd = ss.selectOne("kr.co.sist.elysian.member.board.notice.selectPrevNotice",nVO);
		mbDAO.closeHandler(ss);
		return nd;
		
		
		
	}//selectPrevNotice
	
	public int updateViewCount(String noticeNum) {
		
		SqlSession ss = mbDAO.getMyBatisHandler(true);
		return ss.update("kr.co.sist.elysian.member.board.notice.updateViewCount",noticeNum);
		
	}//updateViewCount

}
