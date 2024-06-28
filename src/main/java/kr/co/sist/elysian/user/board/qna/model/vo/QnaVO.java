package kr.co.sist.elysian.user.board.qna.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class QnaVO {
	
	private int page;
	private String searchCtgry,searchDataValue;
	
    // 페이지 번호에 따른 시작 행과 끝 행 계산
    public int getStartRow() {
        return (page * 10) - 9;
    }

    public int getEndRow() {
        return page * 10;
    }
	
}
