package kr.co.sist.elysian.user.login.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.sist.elysian.user.login.model.domain.UserDomain;
import kr.co.sist.elysian.user.login.model.vo.UserVO;
import kr.co.sist.elysian.user.login.repository.UserDAO;

@Service
public class NaverService {
	
	@Autowired
	private UserDAO uDAO;
	
	@Autowired
	private LoginService ls;

	@Value("${naver.client.id}")
    private String CLIENT_ID;

    @Value("${naver.client.secret}")
    private String CLIENT_SECRET;
	
    public String getNaverAccessToken(String code) throws Exception {
        RestTemplate restTemplate = new RestTemplate();

        String tokenUrl = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&client_id=" + CLIENT_ID +
                "&client_secret=" + CLIENT_SECRET + "&code=" + code;

        String response = restTemplate.getForObject(tokenUrl, String.class);
        ObjectMapper mapper = new ObjectMapper();
        JsonNode node = mapper.readTree(response);

        return node.get("access_token").asText();
    }//getNaverAccessToken
    
    public Map<String, Object> getNaverUserInfo(String accessToken) throws Exception {
        RestTemplate restTemplate = new RestTemplate();
        String userInfoUrl = "https://openapi.naver.com/v1/nid/me";

        String response = restTemplate.getForObject(userInfoUrl + "?access_token=" + accessToken, String.class);
        ObjectMapper mapper = new ObjectMapper();
        JsonNode node = mapper.readTree(response);

        return mapper.convertValue(node.get("response"), Map.class);
    }//getNaverUserInfo
    
    public String handleNaverUserInfo(Map<String, Object> userInfo, HttpSession session, String loginMethod) throws Exception {
        String socialId = userInfo.get("id").toString();
        UserVO uVO = new UserVO();
        uVO.setSocialId(socialId);
        uVO.setLoginMethod(loginMethod);

        // DB에서 사용자 정보 확인
        UserDomain existingUser = uDAO.selectSocialLogin(uVO);

        if (existingUser != null) {
            // 사용자 정보가 이미 존재하면 로그인 페이지로 리다이렉트
            // 세션에 사용자 정보 저장
            session.setAttribute("userId", existingUser.getUserId());
            session.setAttribute("loginMethod", loginMethod);

            // 로그인 날짜 갱신
            ls.updateSocialLoginDate(uVO);

            return "/user/index.do";
        } else {
            // 사용자 정보가 없으면 회원가입 페이지로 리다이렉트
            // 요청 파라미터로 사용자 정보 전달
            return "/user/socialJoin.do?socialId=" + socialId + "&loginMethod=NAVER";
        }
    }
    
    
}//class
