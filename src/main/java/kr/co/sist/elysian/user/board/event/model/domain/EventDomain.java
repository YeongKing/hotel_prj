package kr.co.sist.elysian.user.board.event.model.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EventDomain {


	private String eventNum, adminId , eventTitle,eventSubTitle, eventStartDate, eventEndDate , eventMainImg, eventSubImg, eventContent, eventInputdate;
	
}
