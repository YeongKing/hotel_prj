package kr.co.sist.elysian.admin.board.qna.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class QnaVO {

	private String qnaTitle, qnaContent, adminId, qnaType ;
	private int qnaNum;
	
}
