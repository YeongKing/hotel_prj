package kr.co.sist.elysian.admin.board.event.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EventVO {

	private int eventNum;
	private String eventTitle, eventStartDate, eventEndDate , eventMainImg, eventSubImg,eventContent;
	
	
	
}
