package kr.co.sist.elysian.user.login.repository;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sist.elysian.common.dao.MyBatisDAO;
import kr.co.sist.elysian.user.login.model.domain.UserDomain;
import kr.co.sist.elysian.user.login.model.vo.UserVO;

@Repository
public class UserDAO {
	
	@Autowired(required = false)
	private MyBatisDAO mbDAO;
	
	public UserDomain selectLogin( UserVO uVO ) throws PersistenceException {
		
		UserDomain udm = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		udm = ss.selectOne("kr.co.sist.elysian.member.login.searchLogin", uVO);
		mbDAO.closeHandler(ss);
		return udm;
	}
	
}
