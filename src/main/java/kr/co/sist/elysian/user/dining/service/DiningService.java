package kr.co.sist.elysian.user.dining.service;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.elysian.user.dining.model.domain.DiningDomain;
import kr.co.sist.elysian.user.dining.repository.DiningDAO;

@Service("userDiningService")
public class DiningService{

	@Autowired(required = false)
	private DiningDAO userDiningDAO;
	
	public DiningDomain searchRandomDiningDetail() {
		DiningDomain dDomain = null;
		try {
			dDomain = userDiningDAO.selectRandomDiningDetail();
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		return dDomain;
	}

}
