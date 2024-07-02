package kr.co.sist.elysian.user.room.model.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RoomListDomain {


	private int  roomSize,roomBasicCapacity, roomMaxCapacity,roomBasicPrice,roomAddPrice, bedCnt;
	private String roomRankCode, roomRankName, viewCode, viewName,bedCode, bedName,deleteStatus;

}
