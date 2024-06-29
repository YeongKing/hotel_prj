package kr.co.sist.elysian.user.pay.service;


import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * url과 key screat을통해 해당 토큰을 가져오는 서비스
 * @author user
 *
 */
@Service
public class TokenSerivce {
	//log4j에 로그 추가

	//Import에서 토큰을 가져오는 url
	public static final String IMPORT_TOKEN_URL = "https://api.iamport.kr/users/getToken";
	//REST API키
	public static final String KEY = "0663051873408815";
	//SCRET
	public static final String SECRET = "WfXfbqE0o4UlTT8yHpqjfPxJ2H936gd5MEXvEpZQ5LMTi6s7rPSFeyTJlNz5l87xrQHJNr0MCas3XNO2";
	
	//아임포트 인증(토큰)을 받아주는 함수
	public String getImportToken() {
		String result = "";
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(IMPORT_TOKEN_URL);
		 List<NameValuePair> urlParameters = new ArrayList<NameValuePair>();
	        urlParameters.add(new BasicNameValuePair("imp_key", KEY));
	        urlParameters.add(new BasicNameValuePair("imp_secret", SECRET));

			try {
				post.setEntity(new UrlEncodedFormEntity(urlParameters));
				HttpResponse res = client.execute(post);
				ObjectMapper mapper = new ObjectMapper();
				String body = EntityUtils.toString(res.getEntity());
				JsonNode rootNode = mapper.readTree(body);
				JsonNode resNode = rootNode.get("response");
				result = resNode.get("access_token").asText();
			
			}catch (Exception e) {
				e.printStackTrace();
			}


			return result;
		}
	
}
