package kr.co.sist.elysian.user.home.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class HomeDomain {

	private String eventNum, eventTitle, eventStartDate, eventEndDate, eventContent, eventMainImg, eventSubImg, eventImgFullPath, eventSubImgFullPath;
	
} // class