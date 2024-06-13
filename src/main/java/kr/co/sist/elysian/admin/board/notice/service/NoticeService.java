package kr.co.sist.elysian.admin.board.notice.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.elysian.admin.board.notice.model.domain.NoticeListDomain;
import kr.co.sist.elysian.admin.board.notice.repository.NoticeDAO;

@Service
public class NoticeService {

	@Autowired(required = false)
	private NoticeDAO nDAO;
	
	public List<NoticeListDomain> searchNoticeList(){
		List<NoticeListDomain> list = null;
		try {
			list =nDAO.selectNoticeList();
		}catch(PersistenceException pe){
			pe.printStackTrace();
			
		}//end catch
		return list;
	}

}
