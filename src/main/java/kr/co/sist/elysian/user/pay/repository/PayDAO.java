package kr.co.sist.elysian.user.pay.repository;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sist.elysian.common.dao.MyBatisDAO;
import kr.co.sist.elysian.user.pay.model.vo.PayVO;

@Repository("userPayDAO")
public class PayDAO {

    @Autowired(required = false)
    private MyBatisDAO mbDAO;

	public int insertPayInfo(PayVO pVO) throws PersistenceException{
		
		SqlSession ss= mbDAO.getMyBatisHandler(true);
		int result = ss.insert("kr.co.sist.elysian.member.pay.insertPayInfo",pVO);
		mbDAO.closeHandler(ss);
		return result;
		
	}//insertPayInfo
	
	
	public String selectPayNum(String impUid) throws PersistenceException{
		
		SqlSession ss= mbDAO.getMyBatisHandler(true);
		String payNum = ss.selectOne("kr.co.sist.elysian.member.pay.selectPayNum",impUid);
		mbDAO.closeHandler(ss);
		return payNum;
		
	}//selectPayNum
	
	
    
}