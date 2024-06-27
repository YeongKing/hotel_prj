package kr.co.sist.elysian.user.room.model.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RoomResVO {

	private int roomId, adultsNum, kidsNum ,night , payPrice;
	private String payNum, userId, roomResStatus, ckinDate, ckoutDate, guestPhone, guestEmail, guestBirthday,
	      roomRankCode,roomRankName,bedCode,bedName,viewCode,viewName,guestRequest;
}

