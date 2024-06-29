package kr.co.sist.elysian.user.board.notice.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.elysian.user.board.notice.model.domain.NoticeDomain;
import kr.co.sist.elysian.user.board.notice.model.vo.NoticeVO;
import kr.co.sist.elysian.user.board.notice.repository.NoticeDAO;
import kr.co.sist.elysian.user.board.qna.model.vo.QnaVO;

@Service("memberNoticeService")
public class NoticeService{
	
	@Autowired(required = false)
	private NoticeDAO ndao;
	
	
	public List<NoticeDomain> selectNoticeList(NoticeVO nVO){
		List<NoticeDomain> list = null;
		
		try {
			list = ndao.selectNoticeList(nVO);
			
			
		}catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		
		
		
		
		
		return list;
		
		
	}//selectNoticeList
	
	
	public int selectPage(NoticeVO nVO){
		int page = 0;
		
		try {
			page = ndao.selectPage(nVO);
			
			
		}catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		

		
		return page;
		
		
	}//selectPage
	
	
	public NoticeDomain selectNoticeDetail(NoticeVO nVO){
		NoticeDomain nd = null;
		
		try {
			nd = ndao.selectNoticeDetail(nVO);
			
			
		}catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		

		
		return nd;
		
		
	}//selectNoticeDetail
	
	public NoticeDomain selectNextNotice(NoticeVO nVO){
		NoticeDomain nd = null;
		
		try {
			nd = ndao.selectNextNotice(nVO);
			
			
		}catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		

		
		return nd;
		
		
	}//selectNextNotice
	
	public NoticeDomain selectPrevNotice(NoticeVO nVO){
		NoticeDomain nd = null;
		
		try {
			nd = ndao.selectPrevNotice(nVO);
			
			
		}catch (PersistenceException pe) {
			pe.printStackTrace();
		}
		

		
		return nd;
		
		
	}//selectPrevNotice
	
	
	public int updateViewCount(String noticeNum) {
		
		return ndao.updateViewCount(noticeNum);
		
		
	}//updateViewCount
	
	

}
