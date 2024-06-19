package kr.co.sist.elysian.admin.login.service;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.elysian.admin.login.model.domain.AdminDomain;
import kr.co.sist.elysian.admin.login.model.vo.AdminVO;
import kr.co.sist.elysian.admin.login.repository.LoginDAO;

@Service
public class LoginService {
	
	@Autowired(required = false)
	private LoginDAO lDAO;
	
	public AdminDomain searchLogin( AdminVO aVO ){
//		System.out.println("Service aVO : " + aVO);
		AdminDomain adm = null;
		try {
			adm =lDAO.selectLogin( aVO );
		}catch(PersistenceException pe){
			pe.printStackTrace();
			
		}//end catch
		
		System.out.println("Service aVO: " + adm);
//		System.out.println("Service adm: " + adm);
		return adm;

	
}
}
