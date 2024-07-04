package kr.co.sist.elysian.user.login.service;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.elysian.user.login.model.domain.UserDomain;
import kr.co.sist.elysian.user.login.model.vo.UserVO;
import kr.co.sist.elysian.user.login.repository.UserDAO;

@Service("userLoginService")
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

	
	public void updateLoginDate(String userId ) {

		
		try {
			uDAO.updateLoginDate( userId );
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		

		
	}//updateLoginDate
	
	
	
	
	
	
}
