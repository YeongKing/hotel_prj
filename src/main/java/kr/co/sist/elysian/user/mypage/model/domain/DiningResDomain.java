package kr.co.sist.elysian.user.mypage.model.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DiningResDomain {
	
	private int payPrice, visitPeople, adultCnt, childCnt, babyCnt;
	private String payNum, diningName, diningResStatus, diningResStatusStr, diningResDate,
				visitorName, visitorPhone, visitorEmail, visitorReqeust,
				visitDate, visitTime;

} // class