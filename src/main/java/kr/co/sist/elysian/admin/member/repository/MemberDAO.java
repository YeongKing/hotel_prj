package kr.co.sist.elysian.admin.member.repository;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sist.elysian.admin.member.model.domain.MemberListDomain;
import kr.co.sist.elysian.common.dao.MyBatisDAO;


@Repository
public class MemberDAO {

	@Autowired(required = false)
	private MyBatisDAO mbDAO;
	
	public List<MemberListDomain> selectMemeberList() throws PersistenceException{
		
		List<MemberListDomain> list = null;
		
		SqlSession ss= mbDAO.getMyBatisHandler(false);
		list = ss.selectList("kr.co.sist.elysian.admin.member.memberList");
		mbDAO.closeHandler(ss);
		return list;
		
	}
	
	
	
}
