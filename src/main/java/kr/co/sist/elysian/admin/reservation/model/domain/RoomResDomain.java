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

	private int num, roomFloor, roomId, adultsNum, kidsNum, payPrice, bedCnt ;
	private String payNum, roomResStatus, engLName, engFName, guestPhone, guestEmail, guestRequest, cardName, cardNum, roomRankName, viewName, bedName ;
	private Date checkIn, checkOut, roomResDate, payTime ;
	
	private String room, engName, checkInStr, checkOutStr, roomResDateStr;
	private String adultsNumStr, kidsNumStr, payPriceStr, payTimeStr;
	
} // class