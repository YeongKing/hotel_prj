package kr.co.sist.elysian.admin.board.notice.model.domain;



import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NoticeDomain {

	private int  noticeViewCount ;
	private String noticeNum, noticeTitle, noticeContent, adminId, noticeInputDate;
}
