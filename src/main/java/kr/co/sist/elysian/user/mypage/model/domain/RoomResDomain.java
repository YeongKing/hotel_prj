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
	
	private int adultsNum, kidsNum, payPrice;
	private String payNum, roomResStatus, engName, guestPhone, guestEmail, guestReqeust, cardName, roomInfo, checkIn, checkOut;

} // class