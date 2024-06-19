package kr.co.sist.elysian.user.login.service;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;

import kr.co.sist.elysian.user.login.model.domain.UserDomain;
import kr.co.sist.elysian.user.login.model.vo.UserVO;
import kr.co.sist.elysian.user.login.repository.UserDAO;

public class LoginService{
	
	@Autowired(required = false)
	private UserDAO uDAO;
	
	public UserDomain searchLogin( UserVO uVO ) {
		UserDomain udm = null;
		
		try {
			udm = uDAO.selectLogin( uVO );
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return udm;
		
		
	}

}
