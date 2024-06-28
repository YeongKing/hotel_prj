package kr.co.sist.elysian.user.dining.repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sist.elysian.common.dao.MyBatisDAO;
import kr.co.sist.elysian.user.dining.model.domain.DiningDomain;
import kr.co.sist.elysian.user.dining.model.domain.DiningOptionDomain;

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

	public List<DiningOptionDomain> selectAllDiningName()throws PersistenceException {
		List<DiningOptionDomain> dOptionDomain = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		dOptionDomain = ss.selectList("kr.co.sist.elysian.member.dining.allDiningNameList");
		mbDAO.closeHandler(ss);
		return dOptionDomain;
	}

	public DiningDomain selectOneDiningDetail(String diningId) throws PersistenceException {
		DiningDomain dDomain = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		dDomain = ss.selectOne("kr.co.sist.elysian.member.dining.oneDiningDetail",diningId);
		mbDAO.closeHandler(ss);
		return dDomain;
	}

	public int selectDiningSeatCnt(Map<String, Object>paramMap) throws PersistenceException{
		int cnt = 0;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		cnt = ss.selectOne("kr.co.sist.elysian.member.dining.oneDiningSeatCnt",paramMap);
		mbDAO.closeHandler(ss);
		return cnt;
	}
	
	
}
	
