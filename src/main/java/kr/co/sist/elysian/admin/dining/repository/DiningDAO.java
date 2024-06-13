package kr.co.sist.elysian.admin.dining.repository;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sist.elysian.admin.dining.model.domain.DiningListDomain;
import kr.co.sist.elysian.common.dao.MyBatisDAO;

@Repository
public class DiningDAO {
	
	@Autowired(required = false)
	private MyBatisDAO mbDAO;
	
	public List<DiningListDomain> selectDiningList() throws PersistenceException{
		
		List<DiningListDomain> list = null;
		
		SqlSession ss= mbDAO.getMyBatisHandler(false);
		list = ss.selectList("kr.co.sist.elysian.admin.dining.diningList");
		mbDAO.closeHandler(ss);
		return list;
		
	}
	

}
