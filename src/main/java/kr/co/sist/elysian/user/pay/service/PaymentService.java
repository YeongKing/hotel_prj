package kr.co.sist.elysian.user.pay.service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.taglibs.standard.tag.common.core.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.sist.elysian.admin.member.model.domain.MemberDomain;
import kr.co.sist.elysian.user.pay.model.vo.PayVO;
import kr.co.sist.elysian.user.pay.repository.PayDAO;


/**
 * 토큰과 impUid를 사용하여 결제정보를 얻는 서비스
 * @author user
 *
 */
@Service
public class PaymentService {
	
	@Autowired(required = false)
	private PayDAO  pDAO;
	
	
	//log4j에 로그 추가
    //아임포트 URL
    private static final String IMPORT_PAYMENT_URL = "https://api.iamport.kr/payments/";
    
    //타임스탬프 스트링 변환 메서드 (사람이읽을수있게)
    private String convertTimestampToString(long timestamp) {
        Date date = new Date(timestamp * 1000); // Unix timestamp is in seconds, convert to milliseconds
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(date);
    }
    
    public Map<String, Object> getPaymentInfo(String token,String impUid ){
        Map<String, Object> result = new HashMap<String, Object>();
        String url = IMPORT_PAYMENT_URL + impUid;
        
        try(CloseableHttpClient client = HttpClientBuilder.create().build()) {
        	HttpGet get = new HttpGet(url);
        	get.addHeader("Authorization", token);
        	
        	HttpResponse response = client.execute(get);
        	String jsonResponse = EntityUtils.toString(response.getEntity());
        	
        	ObjectMapper mapper = new ObjectMapper();
        	JsonNode rootNode = mapper.readTree(jsonResponse);
            JsonNode responseNode = rootNode.get("response");


            // Extracting values from the JsonNode and putting them into the result map
            result.put("status", responseNode.get("status").asText());
            result.put("amount", responseNode.get("amount").asText());
            result.put("buyer_name", responseNode.get("buyer_name").asText());
            result.put("buyer_phone", responseNode.get("buyer_tel").asText());
            result.put("member_email", responseNode.get("buyer_email").asText());

            String buyer_addrStr = responseNode.get("buyer_addr").asText();
            String buyer_postcode = responseNode.get("buyer_postcode").asText();
            String buyer_addr = buyer_addrStr + " " + buyer_postcode; 
            result.put("buyer_addr", buyer_addr);

            long paidAtTimestamp = responseNode.get("paid_at").asLong(); // Payment time as Unix timestamp
            String paidAtFormatted = convertTimestampToString(paidAtTimestamp);
            result.put("paid_at", paidAtFormatted); 
            result.put("buy_product_name", responseNode.get("name").asText());
            result.put("buyer_buyid", responseNode.get("imp_uid").asText());
            result.put("buyer_merid", responseNode.get("merchant_uid").asText());
            result.put("buyer_card_num", responseNode.get("card_number").asText());
            result.put("buyer_pay_ok", responseNode.get("status").asText());
            result.put("apply_num", responseNode.get("apply_num").asText());
            
            System.out.println(result);

        } catch (IOException e) {
			e.printStackTrace();
		}
    	
    	return result;
    }
    
    
    
    
	public boolean insertPayInfo(PayVO pVO){
		int result = 0;
		try {
			result =pDAO.insertPayInfo(pVO);
		}catch(PersistenceException pe){
			pe.printStackTrace();
			
		}//end catch
		
		
		
		return (result==1);
		
		
	}//insertPayInfo
    
	
	
	public String selectPayNum(String impUid){
		String payNum  = null;
		try {
			payNum =pDAO.selectPayNum(impUid);
		}catch(PersistenceException pe){
			pe.printStackTrace();
			
		}//end catch
		return payNum;
		
		
		
	}//selectPayNum
	
    
    
    
    
    
    
    
}
