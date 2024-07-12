package kr.co.sist.elysian.user.mypage.model.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MemberDomain {
	
	private String password, name, birthday, gender, engLName, engFName,
					nationalCode, phone, zipcode, address, addressDetail, email,
					firstPhoneNum, secondPhoneNum, lastPhoneNum,
					firstEmail, lastEmail, kakaoId, googleId, naverId;

} // class