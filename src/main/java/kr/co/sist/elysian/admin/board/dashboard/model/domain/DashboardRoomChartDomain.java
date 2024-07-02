package kr.co.sist.elysian.admin.board.dashboard.model.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DashboardRoomChartDomain {

	private String checkinDate, checkinRatio, checkoutDate, checkoutRatio;
	
}//class