package kr.co.sist.elysian.user.board.notice.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.elysian.user.board.notice.model.domain.NoticeDomain;
import kr.co.sist.elysian.user.board.notice.model.vo.NoticeVO;
import kr.co.sist.elysian.user.board.notice.repository.NoticeDAO;

@Service("memberNoticeService")
public class NoticeService{

	@Autowired(required = false)
	private NoticeDAO ndao;


	/**
	 * 공지사항 리스트 호출 메서드
	 * @param nVO 공지사항VO
	 * @return 공지사항도메인 리스트
	 */
	public List<NoticeDomain> selectNoticeList(NoticeVO nVO){
		List<NoticeDomain> list = null;

		try {
			list = ndao.selectNoticeList(nVO);


		}catch (PersistenceException pe) {
			pe.printStackTrace();
		}





		return list;


	}//selectNoticeList


	/**
	 * 페이지 검색 메서드
	 * @param nVO 공지사항VO
	 * @return 페이지 번호
	 */
	public int selectPage(NoticeVO nVO){
		int page = 0;

		try {
			page = ndao.selectPage(nVO);


		}catch (PersistenceException pe) {
			pe.printStackTrace();
		}



		return page;


	}//selectPage


	/**
	 * 공지사항 세부사항 검색 메서드
	 * @param nVO 공지사항VO
	 * @return 공지사항도메인 
	 */
	public NoticeDomain selectNoticeDetail(NoticeVO nVO){
		NoticeDomain nd = null;

		try {
			nd = ndao.selectNoticeDetail(nVO);


		}catch (PersistenceException pe) {
			pe.printStackTrace();
		}



		return nd;


	}//selectNoticeDetail

	/**
	 * 공지사항 클릭시 다음 공지사항 검색 메서드
	 * @param nVO 공지사항VO
	 * @return 공지사항도메인
	 */
	public NoticeDomain selectNextNotice(NoticeVO nVO){
		NoticeDomain nd = null;

		try {
			nd = ndao.selectNextNotice(nVO);


		}catch (PersistenceException pe) {
			pe.printStackTrace();
		}



		return nd;


	}//selectNextNotice

	/**
	 * 공지사항 클릭시 다음 공지사항 검색 메서드
	 * @param nVO 공지사항VO
	 * @return 공지사항 도메인
	 */
	public NoticeDomain selectPrevNotice(NoticeVO nVO){
		NoticeDomain nd = null;

		try {
			nd = ndao.selectPrevNotice(nVO);


		}catch (PersistenceException pe) {
			pe.printStackTrace();
		}



		return nd;


	}//selectPrevNotice


	/**
	 * 공지사항 조회수 카운트 메서드
	 * @param noticeNum 공지사항번호
	 * @return 1이면 성공
	 */
	public int updateViewCount(String noticeNum) {

		return ndao.updateViewCount(noticeNum);


	}//updateViewCount



}
