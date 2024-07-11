package kr.co.sist.elysian.user.mypage.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MemberVO {
	
	private String id, password, engLName, engFName, nationalCode, 
					phone, zipcode, address, addressDetail, email, linkedSocial;

} // class