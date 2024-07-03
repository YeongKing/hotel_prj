package kr.co.sist.elysian.user.mypage.model.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NationalDomain {
	
	private String nationalCode, nationalName;

} // class