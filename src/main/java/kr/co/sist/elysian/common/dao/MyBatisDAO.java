package kr.co.sist.elysian.common.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisDAO {
    private static MyBatisDAO mbDAO;
    private static SqlSessionFactory ssf;

    private MyBatisDAO() {
        org.apache.ibatis.logging.LogFactory.useLog4J2Logging();
    }

    public static MyBatisDAO getInstance() {
        if (mbDAO == null) {
            mbDAO = new MyBatisDAO();
        }
        return mbDAO;
    }

    static {
        if (ssf == null) {
            try {
                Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
                ssf = new SqlSessionFactoryBuilder().build(reader);
                if (reader != null) { reader.close(); }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public SqlSession getMyBatisHandler(boolean autoCommit) {
        return ssf.openSession(autoCommit);
    }

    public void closeHandler(SqlSession ss) {
        if (ss != null) { ss.close(); }
    }
}