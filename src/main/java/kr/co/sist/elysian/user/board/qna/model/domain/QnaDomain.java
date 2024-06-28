package kr.co.sist.elysian.user.board.qna.model.domain;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class QnaDomain {
	
	private int num;
	private String qnaTitle, qnaContent, qnaType;


}
