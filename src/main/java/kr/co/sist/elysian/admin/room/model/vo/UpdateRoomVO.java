package kr.co.sist.elysian.admin.room.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UpdateRoomVO {

	private int roomId , bedCnt;
	private String bedCode, bedName;
}
