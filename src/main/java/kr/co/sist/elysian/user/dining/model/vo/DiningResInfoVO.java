package kr.co.sist.elysian.user.dining.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DiningResInfoVO {
	private String payNum, diningName, diningImg,visitDate, visitDateTime,location,requests, 
	vistorName,visitorPhone, bookerName, bookerPhone, bookerEmail;
	private int person,totalPrice,visitPeople;
}
