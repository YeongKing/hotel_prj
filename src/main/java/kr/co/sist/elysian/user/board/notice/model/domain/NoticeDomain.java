package kr.co.sist.elysian.user.board.notice.model.domain;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NoticeDomain {
	
	private int noticeViewCnt;
	private String noticeNum, noticeTitle, noticeContent, noticeInputdate;


}
