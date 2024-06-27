package kr.co.sist.elysian.user.room.repository;

import java.util.List;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sist.elysian.user.pay.model.vo.PayVO;
import kr.co.sist.elysian.user.room.model.domain.MemberDomain;
import kr.co.sist.elysian.user.room.model.domain.RoomListDomain;
import kr.co.sist.elysian.user.room.model.vo.RoomResVO;
import kr.co.sist.elysian.common.dao.MyBatisDAO;

@Repository("userRoomDAO")
public class RoomDAO {

    @Autowired(required = false)
    private MyBatisDAO mbDAO;

    public List<RoomListDomain> selectRoomList(RoomResVO rrVO) throws PersistenceException {
        List<RoomListDomain> list = null;
        SqlSession ss = mbDAO.getMyBatisHandler(false);
        list = ss.selectList("kr.co.sist.elysian.member.room.roomList", rrVO);
        mbDAO.closeHandler(ss);
        return list;
    }
    
    public MemberDomain selectMember(String userId) throws PersistenceException {
    	MemberDomain umd = null;
        SqlSession ss = mbDAO.getMyBatisHandler(false);
        umd = ss.selectOne("kr.co.sist.elysian.member.room.memberDetail", userId);
        mbDAO.closeHandler(ss);
        return umd;
    }
    
    public int resveValid(RoomResVO rrVO) throws PersistenceException {
    	int roomId ;
        SqlSession ss = mbDAO.getMyBatisHandler(false);
        roomId = ss.selectOne("kr.co.sist.elysian.member.room.resveValid", rrVO);
        mbDAO.closeHandler(ss);
        return roomId;
    }
    
	public int insertRoomRes(RoomResVO rrVO) throws PersistenceException{
		
		SqlSession ss= mbDAO.getMyBatisHandler(true);
		int result = ss.insert("kr.co.sist.elysian.member.room.insertRoomRes",rrVO);
		mbDAO.closeHandler(ss);
		return result;
		
	}//insertPayInfo
    
    
    
}