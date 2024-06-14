package kr.co.sist.elysian.admin.login.repository;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sist.elysian.admin.login.model.domain.AdminDomain;
import kr.co.sist.elysian.admin.login.model.vo.AdminVO;
import kr.co.sist.elysian.common.dao.MyBatisDAO;

@Repository
public class LoginDAO {

	
	
	@Autowired(required = false)
	private MyBatisDAO mbDAO;
	
	public AdminDomain selectLogin(AdminVO aVO) throws PersistenceException{
		
		AdminDomain adm = null;
		
		System.out.println("DAO aVO : " + aVO);
		SqlSession ss= mbDAO.getMyBatisHandler(false);
		adm = ss.selectOne("kr.co.sist.elysian.admin.login.searchLogin", aVO);
		System.out.println("DAO adm : " + adm);
		mbDAO.closeHandler(ss);
		return adm;
		
	}
	
}
