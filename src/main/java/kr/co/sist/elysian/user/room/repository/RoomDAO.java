package kr.co.sist.elysian.user.room.repository;

import java.util.List;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
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
        list = ss.selectList("kr.co.sist.elysian.user.room.roomList", rrVO);
        mbDAO.closeHandler(ss);
        return list;
    }
}