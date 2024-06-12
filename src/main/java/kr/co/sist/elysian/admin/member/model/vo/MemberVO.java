package kr.co.sist.elysian.admin.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MemberVO {

	private String memberId, name, engLname, engFname, address, addrDetail, email, phone;
	private int zipcode ;
}
