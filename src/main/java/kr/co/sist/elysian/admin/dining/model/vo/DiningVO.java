package kr.co.sist.elysian.admin.dining.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DiningVO {

	private int diningId , hallTable,roomTable, deposit;
	private String diningName, diningType, openTime, closeTime, location, diningImg, diningComment, menu;
	
}
