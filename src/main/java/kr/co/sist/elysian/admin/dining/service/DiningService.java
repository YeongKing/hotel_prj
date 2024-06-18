package kr.co.sist.elysian.admin.dining.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.elysian.admin.dining.model.domain.DiningDomain;
import kr.co.sist.elysian.admin.dining.model.domain.DiningListDomain;
import kr.co.sist.elysian.admin.dining.repository.DiningDAO;
import kr.co.sist.elysian.admin.member.model.domain.MemberDomain;

@Service
public class DiningService {
	
	
	@Autowired(required = false)
	private DiningDAO dDAO;
	
	public List<DiningListDomain> searchDiningList(){
		List<DiningListDomain> list = null;
		try {
			list =dDAO.selectDiningList();
		}catch(PersistenceException pe){
			pe.printStackTrace();
			
		}//end catch
		return list;
		
		
	}//searchDiningList
	
	
	public DiningDomain searchDiningDetail(String diningId){
		DiningDomain dd = null;
		try {
			dd =dDAO.selectDiningDetail(diningId);
		}catch(PersistenceException pe){
			pe.printStackTrace();
			
		}//end catch
		return dd;
		
		
		
	}//searchDiningDetail
	
	
	

}
