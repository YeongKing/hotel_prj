package kr.co.sist.elysian.admin.room.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RoomVO {

	private int roomId,roomSize,roomBasicCapacity,roomMaxCapacity, roomBasicPrice,roomAddPrice, bedCnt;
	private String roomRankCode, roomRankName, viewCode, viewName, bedCode, bedName;
}
