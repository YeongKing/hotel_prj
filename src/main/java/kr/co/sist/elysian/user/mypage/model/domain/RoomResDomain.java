package kr.co.sist.elysian.user.mypage.model.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RoomResDomain {
	
	private int adultsNum, kidsNum, payPrice, addPrice, roomBasicPrice;
	private String payNum, roomResStatus, roomResDate, engName, engFName, engLName,
				guestPhone, guestEmail, guestReqeust, cardName, cardNum, roomInfo, checkIn, checkOut;

} // class