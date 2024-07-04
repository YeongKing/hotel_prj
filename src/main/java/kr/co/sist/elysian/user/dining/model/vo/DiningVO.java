package kr.co.sist.elysian.user.dining.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DiningVO {
	private int hallTable,roomTable, deposit;
	private String diningId, diningName, diningType, openTime, closeTime, location, diningImg, diningComment, menu;
}
