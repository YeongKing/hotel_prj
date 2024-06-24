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

@Service("adminDiningService")
public class DiningService{
	
	
	@Autowired(required = false)
	private DiningDAO adminDiningDAO;

	//다이닝 상세조회
	public DiningDomain searchDiningDetail(String diningId) {
		DiningDomain dd = null;
		try {
			dd =adminDiningDAO.selectDiningDetail(diningId);
		}catch(PersistenceException pe){
			pe.printStackTrace();
			
		}//end catch
		return dd;
	}//searchDiningDetail

	//다이닝 목록 조회
	public List<DiningListDomain> searchDiningList() {
		List<DiningListDomain> list = null;
		try {
			list =adminDiningDAO.selectDiningList();
		}catch(PersistenceException pe){
			pe.printStackTrace();
			
		}//end catch
		return list;
	}//searchDiningList
	
	//다이닝 마지막번호+1 메서드
	public String searchLastDiningId() {
		String nextDiningId = "";
		try {
			String lastDiningId = adminDiningDAO.selectLastDiningId();
			//숫자 추출 과정
			String prefix = "DINING";
			String numberStr = lastDiningId.substring(prefix.length());
			int number = Integer.parseInt(numberStr);
			number++;
			//증가된 숫자 형식에 맞춰 문자열 변환
			nextDiningId = String.format("%s%04d", prefix,number);
			
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return nextDiningId;
	}//searchLastDiningId
	
	
	//다이닝 등록 메서드
	public boolean registerDining(DiningVO dVO) {
		try {
			adminDiningDAO.insertDining(dVO);
			return true;
		}catch(PersistenceException pe) {
			pe.printStackTrace();
			return false;
		}
	}//registerDining
	
	//다이닝 수정 메서드
	public boolean modifyDining(HashMap<String, Object>param) {
		try {
			adminDiningDAO.updateDining(param);
			return true;
		}catch(PersistenceException pe) {
			pe.printStackTrace();
			return false;
		}
	}//modifyDining

	//다이닝 삭제 메서드
	public boolean removeDining(String diningId) {
		try {
			adminDiningDAO.deleteDining(diningId);
			return true;
		}catch(PersistenceException pe) {
			pe.printStackTrace();
			return false;
		}
	}//removeDining
	

	
	
	
	

}
