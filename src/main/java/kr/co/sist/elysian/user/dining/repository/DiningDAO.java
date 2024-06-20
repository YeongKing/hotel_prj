package kr.co.sist.elysian.user.dining.repository;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sist.elysian.common.dao.MyBatisDAO;
import kr.co.sist.elysian.user.dining.model.domain.DiningDomain;

@Repository("userDiningDAO")
public class DiningDAO {
	
	@Autowired(required = false)
	private MyBatisDAO mbDAO;
	
	public DiningDomain selectRandomDiningDetail()throws PersistenceException {
		
		DiningDomain dDomain = null;
		
		SqlSession ss= mbDAO.getMyBatisHandler(false);
		dDomain = ss.selectOne("kr.co.sist.elysian.member.dining.randomDiningDetail");
		mbDAO.closeHandler(ss);
		return dDomain;
	}
	
}
