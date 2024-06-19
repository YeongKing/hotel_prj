package kr.co.sist.elysian.admin.board.notice.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.elysian.admin.board.notice.model.domain.NoticeDomain;
import kr.co.sist.elysian.admin.board.notice.model.domain.NoticeListDomain;
import kr.co.sist.elysian.admin.board.notice.model.vo.NoticeVO;
import kr.co.sist.elysian.admin.board.notice.repository.NoticeDAO;

@Service
public class NoticeService {

	@Autowired(required = false)
	private NoticeDAO nDAO;
	
	public List<NoticeListDomain> selectNoticeList(){
		List<NoticeListDomain> list = null;
		try {
			list =nDAO.selectNoticeList();
		}catch(PersistenceException pe){
			pe.printStackTrace();
			
		}//end catch
		return list;
	}

	
	
	public NoticeDomain selectNoticeDetail(String noticeNum){
		NoticeDomain nd = null;
		try {
			nd =nDAO.selectNoticeDetail(noticeNum);
		}catch(PersistenceException pe){
			pe.printStackTrace();
			
		}//end catch
		return nd;

	}//searchNoticeDetail
	
	public boolean updateNotice(NoticeVO nVO){
		
		try {
			int result =nDAO.updateNotice(nVO);
			return result>0;
		}catch(PersistenceException pe){
			pe.printStackTrace();
			return false;
		}//end catch
	}//updateNotice
	
	
	
	public String selectNoticeNum(){
		String result = "";
		
		try {
			 result =nDAO.selectNoticeNum();

		}catch(PersistenceException pe){
			pe.printStackTrace();
		}//end catch
		return result;
	}//selectNoticeNum
	
	
	public boolean insertNotice(NoticeVO nVO){
		
		try {
			int result =nDAO.insertNotice(nVO);
			return result>0;
		}catch(PersistenceException pe){
			pe.printStackTrace();
			return false;
		}//end catch
	}//insertNotice
	
	
	
	
	
}
