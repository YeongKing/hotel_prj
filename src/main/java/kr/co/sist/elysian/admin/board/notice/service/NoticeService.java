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
	
	/**
	 * 공지사항 리스트 호출 메서드
	 * @return 공지사항 리스트
	 */
	public List<NoticeListDomain> selectNoticeList(){
		List<NoticeListDomain> list = null;
		try {
			list =nDAO.selectNoticeList();
		}catch(PersistenceException pe){
			pe.printStackTrace();
			
		}//end catch
		return list;
	}

	
	
	/**
	 * 공지사항 세부정보 호출 메서드
	 * @param noticeNum 공지사항 번호
	 * @return 공지사항도메인
	 */
	public NoticeDomain selectNoticeDetail(String noticeNum){
		NoticeDomain nd = null;
		try {
			nd =nDAO.selectNoticeDetail(noticeNum);
		}catch(PersistenceException pe){
			pe.printStackTrace();
			
		}//end catch
		return nd;

	}//searchNoticeDetail
	
	/**
	 * 공지사항 세부정보 수정 메서드
	 * @param nVO 공지사항VO
	 * @return 성공실패유무
	 */
	public boolean updateNotice(NoticeVO nVO){
		
		try {
			int result =nDAO.updateNotice(nVO);
			return result>0;
		}catch(PersistenceException pe){
			pe.printStackTrace();
			return false;
		}//end catch
	}//updateNotice
	
	
	
	/**
	 * 공지사항 번호 확인 메서드
	 * @return 공지사항 번호
	 */
	public String selectNoticeNum(){
		String result = "";
		
		try {
			 result =nDAO.selectNoticeNum();

		}catch(PersistenceException pe){
			pe.printStackTrace();
		}//end catch
		return result;
	}//selectNoticeNum
	
	
	
	
	/**
	 * 공지사항 등록 메서드
	 * @param nVO 공지사항VO
	 * @return 성공실패유무
	 */
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
