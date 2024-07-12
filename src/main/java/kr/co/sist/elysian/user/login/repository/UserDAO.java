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
    
    //일반 로그인
    public UserDomain selectLogin(UserVO uVO) throws PersistenceException {
        
        UserDomain udm = null;
        
        SqlSession ss = mbDAO.getMyBatisHandler(false);
        udm = ss.selectOne("kr.co.sist.elysian.member.login.searchLogin", uVO);
        mbDAO.closeHandler(ss);
        return udm;
    }

    //소셜 로그인
    public UserDomain selectSocialLogin(UserVO uVO) {
    	UserDomain udm = null;
    	
    	SqlSession ss = mbDAO.getMyBatisHandler(false);
    	
    	udm = ss.selectOne("kr.co.sist.elysian.member.login.socialLogin", uVO);
    	mbDAO.closeHandler(ss);
    	return udm;
    }
    
    //소셜 로그인 연동
    public int updateSocialId(UserVO uVO) throws PersistenceException {
        SqlSession ss = mbDAO.getMyBatisHandler(true);
        int result = ss.update("kr.co.sist.elysian.member.login.socialConnect", uVO);
        mbDAO.closeHandler(ss);
        return result;
    }
    
    public UserDomain selectPhone(UserVO uVO) throws PersistenceException {
        SqlSession ss = mbDAO.getMyBatisHandler(false);

        // 전화번호에 하이픈을 추가하는 로직
        String phone = uVO.getUserPhone();
        if (phone != null && phone.length() == 10) { // 예: 0101234567
            phone = phone.replaceFirst("(\\d{3})(\\d{3})(\\d+)", "$1-$2-$3");
        } else if (phone != null && phone.length() == 11) { // 예: 01012345678
            phone = phone.replaceFirst("(\\d{3})(\\d{4})(\\d+)", "$1-$2-$3");
        }

        uVO.setUserPhone(phone); // 하이픈이 포함된 전화번호를 설정
        System.out.println("Executing query with phone: " + uVO.getUserPhone()); // 추가된 출력문

        UserDomain udm = ss.selectOne("kr.co.sist.elysian.member.login.searchPhone", uVO);
        System.out.println("Query result: " + udm); // 추가된 출력문
        mbDAO.closeHandler(ss);
        return udm;
    }
    
    public int updateUserPw(UserVO uVO) throws PersistenceException {
        SqlSession ss = mbDAO.getMyBatisHandler(true);
        int result = ss.update("kr.co.sist.elysian.member.login.modifyPw", uVO);
        mbDAO.closeHandler(ss);
        return result;
    }
    
    public void updateLoginDate(String userId) throws PersistenceException {

        SqlSession ss = mbDAO.getMyBatisHandler(true);
        ss.update("kr.co.sist.elysian.member.login.updateLoginDate", userId);
        mbDAO.closeHandler(ss);
    }
    
    //소셜로그인 후 최근접속일자와 로그인방법 변경
    public int updateSocialLoginDate(UserVO uVO) throws PersistenceException {

        SqlSession ss = mbDAO.getMyBatisHandler(true);
        int result = ss.update("kr.co.sist.elysian.member.login.updateSocialLoginDate", uVO);
        mbDAO.closeHandler(ss);
		return result;
    }
    
    //회원가입시 아이디 중복확인
    public UserDomain selectUser(UserVO uVO) throws PersistenceException {
    	UserDomain udm = null;
        
        SqlSession ss = mbDAO.getMyBatisHandler(false);
        udm = ss.selectOne("kr.co.sist.elysian.member.join.searchUser", uVO);
        mbDAO.closeHandler(ss);
        return udm;
    }
    
    //회원가입시 이메일 중복확인
    public UserDomain selectEmail(UserVO uVO) throws PersistenceException {
    	UserDomain udm = null;
    	
    	SqlSession ss = mbDAO.getMyBatisHandler(false);
    	udm = ss.selectOne("kr.co.sist.elysian.member.join.searchEmail", uVO);
    	mbDAO.closeHandler(ss);
    	return udm;
    }
    
    //회원가입
    public int insertUserInfo(UserVO uVO) throws PersistenceException {
    	
    	SqlSession ss = mbDAO.getMyBatisHandler(true);
    	int cnt = ss.insert("kr.co.sist.elysian.member.join.insertUser", uVO);
    	mbDAO.closeHandler(ss);
    	return cnt;
    }
    
    

    
}
