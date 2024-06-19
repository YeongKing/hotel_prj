package kr.co.sist.elysian.admin.board.notice.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NoticeVO {

	private String noticeNum,noticeTitle, noticeContent, adminId ,noticeInputdate ;

}
