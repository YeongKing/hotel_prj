package kr.co.sist.elysian.admin.reservation.model.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DiningResDomain {

	private int num, visitPeople, payPrice ;
	private String payNum, diningResStatus, diningName, visitorName, visitorPhone, visitorEmail, visitorRequest, cardName, cardNum ;
	private Date visitDateTime, diningResDate;
	
	private String visitDate, visitTime, visitPeopleStr, adultsCntStr, childCntStr, babyCntStr, payPriceStr, diningResDateStr;
	
} // class