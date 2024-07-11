package kr.co.sist.elysian.user.login.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class UserVO {
	
	private String userId, userName, eName1, eName2, userPhone, userPw, 
					genderCode, postcode, nationCode, userBirth, address, 
					detailAddress, email, loginMethod, socialId, linkedSocial;

}
