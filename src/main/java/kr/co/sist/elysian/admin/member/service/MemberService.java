package kr.co.sist.elysian.admin.member.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.elysian.admin.member.model.domain.MemberDomain;
import kr.co.sist.elysian.admin.member.model.domain.MemberListDomain;
import kr.co.sist.elysian.admin.member.repository.MemberDAO;


@Service
public class MemberService {
	
	
	@Autowired(required = false)
	private MemberDAO mDAO;
	
	public List<MemberListDomain> searchMemberList(){
		List<MemberListDomain> list = null;
		try {
			list =mDAO.selectMemeberList();
		}catch(PersistenceException pe){
			pe.printStackTrace();
			
		}//end catch
		return list;
		
		
		
	}//searchMemberList
	
	
	
	public MemberDomain searchMemberDetail(String memberId){
		MemberDomain mD = null;
		try {
			mD =mDAO.selectMemeberDetail(memberId);
		}catch(PersistenceException pe){
			pe.printStackTrace();
			
		}//end catch
		return mD;
		
		
		
	}//searchMemberDetail
	
	
	
	

}
