package kr.co.sist.elysian.user.room.model.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RoomDomain {

	private String eventNum, eventTitle, eventStartDate, eventEndDate, eventContent, eventMainImg, eventSubImg, eventImgFullPath,eventSubImgFullPath;
	
} // class