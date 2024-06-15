package kr.co.sist.elysian.admin.board.qna.model.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class QnaDomain {
	
	private String qnaNum, qnaTitle, qnaContent, adminId, qnaType ,qnaInputdate;


}
