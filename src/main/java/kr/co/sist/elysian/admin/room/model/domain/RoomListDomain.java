package kr.co.sist.elysian.admin.room.model.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RoomListDomain {

	private int roomId, roomSize;
	private String roomRankName, viewName, bedName;
	
	
}
