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
		
		//COMMON_CODE���̺��� 
		//CODE_NAME�� "�ȱ��" �� CODE_VAL�� ��ȯ
		String result = dDAO.testMethod("�ȱ��");

		System.out.println(result);
		
	}//main
	
	
	

}
