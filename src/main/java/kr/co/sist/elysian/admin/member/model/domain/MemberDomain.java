package kr.co.sist.elysian.admin.member.model.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MemberDomain {

	private String memberId, name, gender, phone, engLname, engFname, address, addrDetail, email;
	private int nationalCode, zipcode;
	private Date birthday, loginDate, signupDate;

	
}
