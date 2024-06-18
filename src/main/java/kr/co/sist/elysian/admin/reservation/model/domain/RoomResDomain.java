package kr.co.sist.elysian.admin.reservation.model.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RoomResDomain {

	private int num, roomFloor, roomId, adultsNum, kidsNum, cardNum, payPrice, bedCnt ;
	private String payNum, roomResStatus, engLName, engFName, guestPhone, guestEmail, guestRequest, cardCode, roomRankName, viewName, bedName ;
	private Date checkIn, checkOut, roomResDate ;
	
	private String room, engName, checkInStr, checkOutStr, roomResDateStr;
	
} // class