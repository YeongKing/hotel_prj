package kr.co.sist.elysian.admin.dining.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class DiningVO {
	private  int hallTable,roomTable, deposit;
	private  String diningId, diningName, diningType, openTime, closeTime, location, diningImg, diningComment, menu;
	
}
