package kr.co.sist.elysian.user.dining.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DiningSeatsVO {
	private String table, diningId,diningDate;
	private int diningTime, tableCount; 
}
