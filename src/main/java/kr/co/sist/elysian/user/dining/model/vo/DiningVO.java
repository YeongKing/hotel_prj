package kr.co.sist.elysian.user.dining.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DiningVO {
	private int hallTable,roomTable, deposit;
	private String diningId, diningName, diningType, openTime, closeTime, location, diningImg, diningComment, menu;
}
