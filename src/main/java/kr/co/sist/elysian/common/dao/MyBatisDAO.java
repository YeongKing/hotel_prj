package kr.co.sist.elysian.common.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Component;

@Component
//private static MyBatisDAO mbDAO;
public class MyBatisDAO {
private static SqlSessionFactory ssf;//singleton 사용권장 => 비용 절감 , 일관성 유지, 관리용이


private MyBatisDAO() {
	org.apache.ibatis.logging.LogFactory.useLog4J2Logging();
	
	
}//MybatisDAO

/*
 * public static MyBatisDAO getInstance() { if (mbDAO == null) { mbDAO = new
 * MyBatisDAO();
 * 
 * } // end if
 * 
 * return mbDAO; }// getInstance
 */	


/**
 * SqlSessionFactory는 비용절감, 일관성 유지, 관리의 용의성을 위해서 Singleton Pattern으로 사용한다.
 * @return
 */
static {//static영역 : 호출하지 않고 클래스가 생성되면 자동호출 되는 영역.
	if(ssf ==null) {
		try {
			//1. 설정 파일과 연결
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			
			//2. MyBatis Framework 생성
			ssf= new SqlSessionFactoryBuilder().build(reader);
			
			//3. 스트림 닫기
			if(reader!=null) {reader.close();}//end if
			
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		
		
	}//end if

}//static 영역

public SqlSession getMyBatisHandler(boolean autoCommit) {
	SqlSession ss = null;
	
	ss = ssf.openSession(autoCommit);
	
	return ss;
}//getMyBatisHandler


// MyBatis Handler 닫기
public void closeHandler(SqlSession ss) {

 if(ss!=null) {ss.close();}//end if
	
}






}// class
