package kr.co.sist.elysian.admin.room.model.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RoomDomain {

	private int roomId, rankCode, viewCode, bedCode, roomSize, roomBasicCapacity, roomMaxCapacity, roomBasicPrice, roomAddPrice;
	private String roomRankName, viewName, bedName;
	
}
