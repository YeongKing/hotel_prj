package kr.co.sist.elysian.admin.board.notice.repository;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sist.elysian.admin.board.notice.model.domain.NoticeListDomain;
import kr.co.sist.elysian.common.dao.MyBatisDAO;

@Repository
public class NoticeDAO {
	
	@Autowired(required = false)
	private MyBatisDAO mbDAO;
	
	public List<NoticeListDomain> selectNoticeList() throws PersistenceException{
		
		List<NoticeListDomain> list = null;
		
		SqlSession ss= mbDAO.getMyBatisHandler(false);
		list = ss.selectList("kr.co.sist.elysian.admin.board.notice.noticeList");
		mbDAO.closeHandler(ss);
		return list;
		
	}
	

}
