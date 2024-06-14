package kr.co.sist.elysian.admin.member.model.domain;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MemberDomain {

	private String memberId, name, gender, phone, engLname, engFname, address, addrDetail, email,birthday, loginDate, signupDate;
	private int nationalCode, zipcode;

	
	
	
}
