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

	private int visitPeople, cardNum, payPrice ;
	private String diningResNum, diningResStatus, diningName, visitDate, visitTime, visitorName, visitorPhone, visitorEmail, visitorRequest, cardCode ;
	private Date diningResDate;
	
}
