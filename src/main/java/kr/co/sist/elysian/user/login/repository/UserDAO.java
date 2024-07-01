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
    
    public UserDomain selectLogin(UserVO uVO) throws PersistenceException {
        
        UserDomain udm = null;
        
        SqlSession ss = mbDAO.getMyBatisHandler(false);
        udm = ss.selectOne("kr.co.sist.elysian.member.login.searchLogin", uVO);
        mbDAO.closeHandler(ss);
        return udm;
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
    	System.out.println("DAO received userId: " + uVO.getUserId());
        System.out.println("DAO received newPassword: " + uVO.getUserPw());
    	
        SqlSession ss = mbDAO.getMyBatisHandler(true);
        int result = ss.update("kr.co.sist.elysian.member.login.modifyPw", uVO);
        mbDAO.closeHandler(ss);
        return result;
    }

    
}
