package kr.co.sist.elysian.user.login.service;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
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
	
	// 소셜 로그인 연동 메서드
    public int updateSocialId(UserVO uVO) throws PersistenceException {
        return uDAO.updateSocialId(uVO);
    }
    
    // 소셜 로그인 접속일자, 로그인방법 갱신 메서드
    public int updateSocialLoginDate(UserVO uVO) throws PersistenceException {
        return uDAO.updateSocialLoginDate(uVO);
    }
    
    // 비밀번호 암호화 비교 메서드
    public boolean checkPassword(String inputPassword, String storedPassword) {
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder(); // PasswordEncoder 인스턴스 생성
        return passwordEncoder.matches(inputPassword, storedPassword);
    }
	
	
	
	
	
	
}
