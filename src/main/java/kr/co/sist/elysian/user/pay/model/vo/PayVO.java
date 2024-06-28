package kr.co.sist.elysian.user.pay.model.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PayVO {

	private int payPrice;
	private String payNum,cardNum,cardCode,payStatus,payTime,impUid;

	
}

