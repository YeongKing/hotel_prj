package kr.co.sist.elysian.user.dining.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sist.elysian.common.dao.MyBatisDAO;
import kr.co.sist.elysian.user.dining.model.domain.DiningDomain;
import kr.co.sist.elysian.user.dining.model.domain.DiningOptionDomain;
import kr.co.sist.elysian.user.dining.model.vo.DiningResVO;
import kr.co.sist.elysian.user.dining.model.vo.DiningSeatsVO;

@Repository("userDiningDAO")
public class DiningDAO {
	
	@Autowired(required = false)
	private MyBatisDAO mbDAO;
	
	/**
	 * DB에서 랜덤한 다이닝의 상세정보를 가져오는 
	 * @return
	 * @throws PersistenceException
	 */
	public DiningDomain selectRandomDiningDetail()throws PersistenceException {
		
		DiningDomain dDomain = null;
		
		SqlSession ss= mbDAO.getMyBatisHandler(false);
		dDomain = ss.selectOne("kr.co.sist.elysian.member.dining.randomDiningDetail");
		mbDAO.closeHandler(ss);
		return dDomain;
	}

	
	
	/**
	 * DB에서 모든 다이닝번호와 이름을 가져오는
	 * @return
	 * @throws PersistenceException
	 */
	public List<DiningOptionDomain> selectAllDiningName()throws PersistenceException {
		List<DiningOptionDomain> dOptionDomain = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		dOptionDomain = ss.selectList("kr.co.sist.elysian.member.dining.allDiningNameList");
		mbDAO.closeHandler(ss);
		return dOptionDomain;
	}

	
	
	/**
	 * DB에서 SELECT한 다이닝의 상세정보를 가져오는
	 * @param diningId
	 * @return
	 * @throws PersistenceException
	 */
	public DiningDomain selectOneDiningDetail(String diningId) throws PersistenceException {
		DiningDomain dDomain = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		dDomain = ss.selectOne("kr.co.sist.elysian.member.dining.oneDiningDetail",diningId);
		mbDAO.closeHandler(ss);
		return dDomain;
	}

	
	
	/**
	 * DB에서 선택 다이닝의 남은 좌석수를 가져오는
	 * @param paramMap
	 * @return
	 * @throws PersistenceException
	 */
	public int selectDiningSeatCnt(Map<String, Object>paramMap) throws PersistenceException{
		int cnt = 0;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		cnt = ss.selectOne("kr.co.sist.elysian.member.dining.oneDiningSeatCnt",paramMap);
		
		mbDAO.closeHandler(ss);
		return cnt;
	}

	
	/**
	 * DB에서 유저 정보를 가져오는
	 * @param userId
	 * @return
	 * @throws PersistenceException
	 */
	public DiningResVO searchUserName(String userId) throws PersistenceException{
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		DiningResVO dResVO = ss.selectOne("kr.co.sist.elysian.member.dining.diningUserInfo",userId);
		mbDAO.closeHandler(ss);
		return dResVO;
	}

	
	/**
	 * DB에서 다이닝 예약
	 * @param drVO
	 * @return
	 * @throws PersistenceException
	 */
	public int insertDiningReservation(DiningResVO drVO) throws PersistenceException{
		int diningId = 0;
		SqlSession ss = mbDAO.getMyBatisHandler(true);
		diningId = ss.insert("kr.co.sist.elysian.member.dining.diningReservation",drVO);

		mbDAO.closeHandler(ss);
		return diningId;
	}

	
	/**
	 * DB에서 다이닝 예약중 유효성 검사
	 * @param dsVO
	 * @return
	 * @throws PersistenceException
	 */
	public boolean reserveValid(DiningSeatsVO dsVO) throws PersistenceException{
		boolean result = false;
		int resultDining = 0;
		int tableCount = dsVO.getTableCount();
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		resultDining = ss.selectOne("kr.co.sist.elysian.member.dining.reserveValid",dsVO);
		mbDAO.closeHandler(ss);
		
		System.out.println("tableCount : " + tableCount);
		System.out.println("resultDining : " + resultDining);
		
		if(resultDining >= tableCount) {
			result = true;
		}else {
			result = false;
		}
		
		return result;
	}
	
	
}
	
