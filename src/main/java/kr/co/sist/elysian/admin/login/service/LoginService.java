package kr.co.sist.elysian.admin.login.service;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.elysian.admin.login.model.domain.AdminDomain;
import kr.co.sist.elysian.admin.login.model.vo.AdminVO;
import kr.co.sist.elysian.admin.login.repository.LoginDAO;

@Service("adminLoginService")
public class LoginService {
	
	@Autowired(required = false)
	private LoginDAO lDAO;
	
	public AdminDomain searchLogin( AdminVO aVO ){
		AdminDomain adm = null;
		try {
			adm =lDAO.selectLogin( aVO );
		}catch(PersistenceException pe){
			pe.printStackTrace();
			
		}//end catch
		
		return adm;

	
}
}
