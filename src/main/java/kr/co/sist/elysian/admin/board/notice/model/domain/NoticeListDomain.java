package kr.co.sist.elysian.admin.board.notice.model.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NoticeListDomain {

	private String noticeNum, noticeTitle, adminId ;
	private int noticeViewCount ;
	private Date noticeInputDate;
}
