package kr.co.sist.elysian.admin.board.dashboard.model.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DashboardDomain {

	
	
	private int todayRoomResCnt,
				oneMonthRoomResCnt,
				checkinCnt,
				checkoutCnt,
				allMemberCnt,
				todayJoinCnt,
				diningResCnt,
				diningCancelCnt;
	
	
}//class
