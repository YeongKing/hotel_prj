package kr.co.sist.elysian.admin.dining.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sist.elysian.admin.dining.model.domain.DiningDomain;
import kr.co.sist.elysian.admin.dining.model.domain.DiningListDomain;
import kr.co.sist.elysian.admin.dining.model.vo.DiningVO;
import kr.co.sist.elysian.common.dao.MyBatisDAO;

@Repository
public class DiningDAO {
	
	@Autowired(required = false)
	private MyBatisDAO mbDAO;
	
	//DB���� ���̴� ����Ʈ ��ȸ
	public List<DiningListDomain> selectDiningList() throws PersistenceException{
		
		List<DiningListDomain> list = null;
		
		SqlSession ss= mbDAO.getMyBatisHandler(false);
		list = ss.selectList("kr.co.sist.elysian.admin.dining.diningList");
		mbDAO.closeHandler(ss);
		return list;
		
	}//selectDiningList
	
	//DB���� ���̴� ����ȸ
	public DiningDomain selectDiningDetail(String diningId) throws PersistenceException{
		
		DiningDomain dD = null;
		
		SqlSession ss= mbDAO.getMyBatisHandler(false);
		dD = ss.selectOne("kr.co.sist.elysian.admin.dining.diningDetail",diningId);
		mbDAO.closeHandler(ss);
		return dD;
		
	}//selectMemeberDetail
	
	//DB���� ���������̴� ��ȣ ��ȸ
	public String selectLastDiningId()throws PersistenceException{
		String lastDiningId = "";
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		lastDiningId = ss.selectOne("kr.co.sist.elysian.admin.dining.lastDiningId");
		mbDAO.closeHandler(ss);
		return lastDiningId;
	}

	//DB�� ���̴� INSERT
	public void insertDining(DiningVO dVO)throws PersistenceException {
		SqlSession ss = mbDAO.getMyBatisHandler(true);
		ss.insert("kr.co.sist.elysian.admin.dining.addDining",dVO);
		mbDAO.closeHandler(ss);
	}
	
	//DB�� ���̴� UPDATE
	public void updateDining(HashMap<String, Object> param)throws PersistenceException{
		SqlSession ss = mbDAO.getMyBatisHandler(true);
		ss.update("kr.co.sist.elysian.admin.dining.updateDining",param);
		mbDAO.closeHandler(ss);
	}
	

}
