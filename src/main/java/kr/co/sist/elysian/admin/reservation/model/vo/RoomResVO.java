package kr.co.sist.elysian.admin.reservation.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RoomResVO {

	private int roomId;
	private String payNum, guestPhone, guestEmail, guestRequest;
	
}//class