package kr.co.sist.elysian.user.mypage.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DiningResVO {
	
	private String payNum, visitorName, visitorPhone, visitorEmail, visitorRequest;

} // class