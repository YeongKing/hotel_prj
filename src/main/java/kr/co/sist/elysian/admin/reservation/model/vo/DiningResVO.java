package kr.co.sist.elysian.admin.reservation.model.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DiningResVO {

	private String diningResStatus, visitorName, visitorPhone, visitorEmail, visitorRequest;
	
	
}//class
