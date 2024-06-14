package kr.co.sist.elysian.admin.login.model.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AdminDomain {

	private String adminId, adminAuthority, adminPw;
	
}
