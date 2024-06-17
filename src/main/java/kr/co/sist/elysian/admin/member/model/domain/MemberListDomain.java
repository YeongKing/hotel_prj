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
public class MemberListDomain {

	private String memberId, name, phone;
	private Date loginDate, signupDate;

	
}
