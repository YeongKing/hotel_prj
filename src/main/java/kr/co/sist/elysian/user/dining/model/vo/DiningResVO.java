package kr.co.sist.elysian.user.dining.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DiningResVO{
	private String userId, diningId, visitDate,visitTime,name,visitorName,phone,visitorRequest,email,diningResStatus,payNum;
	private int deposit,adult,child,infant,visitPeople;
}
