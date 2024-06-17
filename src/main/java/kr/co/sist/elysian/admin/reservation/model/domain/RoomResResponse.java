package kr.co.sist.elysian.admin.reservation.model.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RoomResResponse {

	private int num;
	private String payNum, roomResStatus, guestPhone, checkIn, checkOut, roomResDate, room, engName;
	
} // class