package kr.co.sist.elysian.admin.board.dashboard.repository;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.co.sist.elysian.common.dao.MyBatisDAO;

public class DashboardDAO {
	
	
	public String testMethod(String name) throws PersistenceException{
		String result ;
		
		
		MyBatisDAO mbDAO = MyBatisDAO.getInstance();
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		
		result = ss.selectOne("kr.co.sist.elysian.test.test",name);
		
		mbDAO.closeHandler(ss);
		

		return result;
		
		
		
	}//testMethod
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public static void main(String[] args) {

		DashboardDAO dDAO = new DashboardDAO();
		
		//COMMON_CODE테이블에서 
		//CODE_NAME가 "안길라" 인 CODE_VAL값 반환!!
		String result = dDAO.testMethod("안길라");

		System.out.println(result);
		
	}//main
	
	
	

}
