package kr.co.sist.elysian.admin.dining.model.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DiningListDomain {

	private String diningId, diningName, diningType;
	
}
