package kr.co.sist.elysian.admin.reservation.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RoomResVO {

	private int roomFloor, roomId, adultsNum, kidsNum;
	private String roomRankName, viewName, bedName, checkoutFlag, roomCancelFlag;
	private Date checkin, checkout;
	
}//class
