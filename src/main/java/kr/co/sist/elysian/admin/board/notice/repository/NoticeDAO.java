package kr.co.sist.elysian.admin.board.notice.repository;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sist.elysian.admin.board.notice.model.domain.NoticeDomain;
import kr.co.sist.elysian.admin.board.notice.model.domain.NoticeListDomain;
import kr.co.sist.elysian.admin.board.notice.model.vo.NoticeVO;
import kr.co.sist.elysian.common.dao.MyBatisDAO;

/**
 * @author user
 *
 */
@Repository
public class NoticeDAO {
	
	@Autowired(required = false)
	private MyBatisDAO mbDAO;
	
	
	
	
	/**
	 * 공지사항 탭 클릭시 공지사항 리스트 선택 메서드
	 * @return 공지사항 리스트
	 * @throws PersistenceException
	 */
	public List<NoticeListDomain> selectNoticeList() throws PersistenceException{
		
		List<NoticeListDomain> list = null;
		
		SqlSession ss= mbDAO.getMyBatisHandler(false);
		list = ss.selectList("kr.co.sist.elysian.admin.board.notice.selectNoticeList");
		mbDAO.closeHandler(ss);
		return list;
		
	}//selectNoticeList
	
	
	
	/**
	 * 공지사항 제목 클릭시 공지사항 세부정보 호출 메서드
	 * @param noticeNum 공지사항 번호
	 * @return 공지사항도메인 
	 * @throws PersistenceException
	 */
	public NoticeDomain selectNoticeDetail(String noticeNum) throws PersistenceException{
		
		NoticeDomain nd = null;
		
		SqlSession ss= mbDAO.getMyBatisHandler(false);
		nd = ss.selectOne("kr.co.sist.elysian.admin.board.notice.selectNoticeDetail",noticeNum);
		mbDAO.closeHandler(ss);
		return nd;
		
	}//selectNoticeDetail
	
	
	
	/**
	 * 공지사항 세부정보 수정 메서드
	 * @param nVO 공지사항 세부정보 VO
	 * @return 1이 반환되면 성공
	 * @throws PersistenceException
	 */
	public int updateNotice(NoticeVO nVO) throws PersistenceException{
		
		SqlSession ss= mbDAO.getMyBatisHandler(true);
		int result = ss.update("kr.co.sist.elysian.admin.board.notice.updateNotice",nVO);
		mbDAO.closeHandler(ss);
		return result;
		
	}//updateNotice
	
	
	/**
	 * 공지사항 번호 호출 메서드
	 * @return 공지사항 번호
	 * @throws PersistenceException
	 */
	public String selectNoticeNum() throws PersistenceException{
		
		SqlSession ss= mbDAO.getMyBatisHandler(false);
		String result = ss.selectOne("kr.co.sist.elysian.admin.board.notice.selectNoticeNum");
		mbDAO.closeHandler(ss);
		return result;
		
	}//selectNoticeNum
	
	


	
	/**
	 * 공지사항 등록 메서드
	 * @param nVO 공지사항VO
	 * @return 1이 반환되면 성공
	 * @throws PersistenceException
	 */
	public int insertNotice(NoticeVO nVO) throws PersistenceException{
		
		SqlSession ss= mbDAO.getMyBatisHandler(true);
		int result = ss.insert("kr.co.sist.elysian.admin.board.notice.insertNotice",nVO);
		mbDAO.closeHandler(ss);
		return result;
		
	}//insertNotice
	
	
}
