package kr.co.sist.elysian.user.pay.controller;

import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.sist.elysian.user.pay.model.vo.PayVO;
import kr.co.sist.elysian.user.pay.service.PaymentService;
import kr.co.sist.elysian.user.pay.service.TokenSerivce;




@RestController
@RequestMapping("/user")
public class PaymentController {
	
	@Autowired
	PaymentService ps;
	

	@Autowired
	TokenSerivce tokenSerivce;
	
	
	@ResponseBody
	@PostMapping("/payment.do")
	public Map<String, Object> payment(@RequestBody Map<String, Object> paymentData,Model model) {
		String impUid = (String)paymentData.get("imp_uid");
		String token = (String)paymentData.get("token");
       
		Map<String, Object> paymentDetails = ps.getPaymentInfo(token, impUid);
		
        return paymentDetails; 
	}//payment
	
	
	
	
	@ResponseBody
	@GetMapping("/getToken.do")
	public String getToekn() {
		String token = tokenSerivce.getImportToken();
		
		return token;
	}//getToekn
	
	
	@ResponseBody
	@PostMapping(value="/insertPayInfo.do", produces="application/json; charset=UTF-8")
	public String insertPayInfo(@RequestBody PayVO pVO) {
        JSONObject data = new JSONObject();

        String payNum = "";
        System.out.println("pVO : " + pVO);

        boolean result = ps.insertPayInfo(pVO);

        System.out.println("result : " + result);

        if (result) {
            payNum = ps.selectPayNum(pVO.getImpUid());
        }

        System.out.println("리턴전 payNum :" + payNum);

        data.put("payNum", payNum); // JSON 객체에 payNum 추가

        return data.toJSONString(); // JSON 객체를 문자열로 변환하여 반환
    
	}//insertPayInfo
	
	@ResponseBody
	@PostMapping(value="/insertDiningPayInfo.do", produces="application/json; charset=UTF-8")
	public String insertDiningPayInfo(@RequestBody PayVO pVO) {
		JSONObject data = new JSONObject();
		
		String payNum = "";
		System.out.println("pVO : " + pVO);
		
		boolean result = ps.insertDiningPayInfo(pVO);
		
		System.out.println("result : " + result);
		
		if (result) {
			payNum = ps.selectPayNum(pVO.getImpUid());
		}
		
		System.out.println("리턴전 payNum :" + payNum);
		
		data.put("payNum", payNum); // JSON 객체에 payNum 추가
		
		return data.toJSONString(); // JSON 객체를 문자열로 변환하여 반환
		
	}//insertDiningPayInfo
	
	
	
	
	
	
	

	
	
}
