package kr.co.sist.elysian.admin.dining.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.elysian.admin.dining.model.domain.DiningDomain;
import kr.co.sist.elysian.admin.dining.model.domain.DiningListDomain;
import kr.co.sist.elysian.admin.dining.model.vo.DiningVO;
import kr.co.sist.elysian.admin.dining.repository.DiningDAO;
import oracle.net.aso.l;

@Service
public class DiningService{
	
	
	@Autowired(required = false)
	private DiningDAO dDAO;

	//���̴� ����ȸ
	public DiningDomain searchDiningDetail(String diningId) {
		DiningDomain dd = null;
		try {
			dd =dDAO.selectDiningDetail(diningId);
		}catch(PersistenceException pe){
			pe.printStackTrace();
			
		}//end catch
		return dd;
	}//searchDiningDetail

	//���̴� ��� ��ȸ
	public List<DiningListDomain> searchDiningList() {
		List<DiningListDomain> list = null;
		try {
			list =dDAO.selectDiningList();
		}catch(PersistenceException pe){
			pe.printStackTrace();
			
		}//end catch
		return list;
	}//searchDiningList
	
	//���̴� ��������ȣ+1 �޼���
	public String searchLastDiningId() {
		String nextDiningId = "";
		try {
			String lastDiningId = dDAO.selectLastDiningId();
			//���� ���� ����
			String prefix = "DINING";
			String numberStr = lastDiningId.substring(prefix.length());
			int number = Integer.parseInt(numberStr);
			number++;
			//������ ���� ���Ŀ� ���� ���ڿ� ��ȯ
			nextDiningId = String.format("%s%04d", prefix,number);
			
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return nextDiningId;
	}
	
	
	//���̴� ��� �޼���
	public boolean registerDining(DiningVO dVO) {
		
		try {
			dDAO.insertDining(dVO);
			return true;
		}catch(PersistenceException pe) {
			pe.printStackTrace();
			return false;
		}
	}
	
	//���̴� ���� �޼���
	public boolean modifyDining(HashMap<String, Object>param) {
		try {
			dDAO.updateDining(param);
			return true;
		}catch(PersistenceException pe) {
			pe.printStackTrace();
			return false;
		}
	}
	
//	//���� ���ε� �޼���
//	public String uploadFile(mu)
	
	
	
	

}
