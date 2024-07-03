package kr.co.sist.elysian.user.home.repository;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sist.elysian.common.dao.MyBatisDAO;
import kr.co.sist.elysian.user.home.model.HomeDomain;

@Repository
public class HomeDAO {
	
	@Autowired
	private MyBatisDAO myBatisDAO;
	
	/**
	 * 메인 페이지에 들어갈 최근 등록된 이벤트 6가지 조회
	 * @return 이벤트 리스트
	 */
	public List<HomeDomain> selectHomeEvent() throws PersistenceException {
		SqlSession ss = myBatisDAO.getMyBatisHandler(false);
		List<HomeDomain> homeEventList = ss.selectList("kr.co.sist.elysian.member.home.selectHomeEvent");
		myBatisDAO.closeHandler(ss);
		return homeEventList;
	} // selectHomeEvent

} // class