package kr.co.sist.elysian.admin.board.event.model.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EventDomain {

	private int eventNum; 
	private String eventTitle, eventStartDate, eventEndDate , eventMainImg, eventSubImg, eventContent;
	
	
	
}
