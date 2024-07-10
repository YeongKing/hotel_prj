package kr.co.sist.elysian.user.login.service;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import kr.co.sist.elysian.user.login.model.domain.UserDomain;
import kr.co.sist.elysian.user.login.model.vo.UserVO;
import kr.co.sist.elysian.user.login.repository.UserDAO;
@Service
public class KakaoService {
	
	@Value("${kakao.client.id}")
	private String CLIENT_ID;
	
    private String REDIRECT_URI = "http://localhost/hotel_prj/user/kakaoLogin.do"; // 리디렉트 URI
	@Autowired
	private UserDAO uDAO;
	
	@Autowired
	private LoginService ls;
	
	/**
     * 카카오 인증 서버로부터 액세스 토큰을 요청하는 메소드
     * @param code 인가 코드
     * @return 액세스 토큰
     * @throws Exception 액세스 토큰을 얻지 못할 경우 예외 발생
     */
    public String getKaKaoAccessToken(String code) throws Exception {
        String url = "https://kauth.kakao.com/oauth/token";
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("grant_type", "authorization_code");
        params.add("client_id", CLIENT_ID);
        params.add("redirect_uri", REDIRECT_URI);
        params.add("code", code);
        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(params, headers);
        ResponseEntity<Map> response = restTemplate.postForEntity(url, request, Map.class);
        Map<String, Object> responseBody = response.getBody();
        if (responseBody == null || !responseBody.containsKey("access_token")) {
            throw new Exception("Failed to get access token from Kakao");
        }
        return (String) responseBody.get("access_token");
    }
    
    /**
     * 액세스 토큰을 사용하여 카카오 사용자 정보를 요청하는 메소드
     * @param accessToken 액세스 토큰
     * @return 사용자 정보가 담긴 맵
     * @throws Exception 사용자 정보를 얻지 못할 경우 예외 발생
     */
    public Map<String, Object> getKaKaoUserInfo(String accessToken) throws Exception {
        String url = "https://kapi.kakao.com/v2/user/me";
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "Bearer " + accessToken);
        HttpEntity<String> entity = new HttpEntity<>(headers);
        ResponseEntity<Map> response = restTemplate.exchange(url, HttpMethod.GET, entity, Map.class);
        Map<String, Object> userInfo = response.getBody();
        if (userInfo == null) {
            throw new Exception("Failed to get user info from Kakao");
        }
        return userInfo;
    }
    
    /**
     * 회원가입 정보를 데이터베이스에 저장하는 메소드
     * @param userVO 회원가입 정보가 담긴 UserVO 객체
     */
    public void registerUser(UserVO uVO) {
        try {
            uDAO.insertUserInfo(uVO);
        } catch (PersistenceException pe) {
            pe.printStackTrace();
            throw new RuntimeException("Failed to register user", pe);
        }
    }
    
    /**
     * 카카오 사용자 정보를 확인하고 세션을 설정하는 메소드
     * @param userInfo 카카오 사용자 정보
     * @param session HttpSession 객체
     * @return 리다이렉트 URL
     * @throws Exception 예외 발생 시
     */
    public String handleKakaoUserInfo(Map<String, Object> userInfo, HttpSession session) throws Exception {
        // 사용자 정보에서 ID와 이메일을 추출
        String kakaoId = userInfo.get("id").toString();
        String kakaoEmail = ((Map<String, Object>) userInfo.get("kakao_account")).get("email").toString();

        // DB에서 사용자 정보 확인
        UserDomain existingUser = uDAO.selectSocialLogin(kakaoId, kakaoEmail);

        if (existingUser != null) {
            // 사용자 정보가 이미 존재하면 로그인 페이지로 리다이렉트
            // 세션에 사용자 정보 저장
            session.setAttribute("userId", existingUser.getUserId());
            session.setAttribute("userName", existingUser.getUserName());
            
            //로그인 날짜 갱신
            ls.updateLoginDate(existingUser.getUserId());
            
            return "/user/index.do";
        } else {
            // 사용자 정보가 없으면 회원가입 페이지로 리다이렉트
            // 요청 파라미터로 사용자 정보 전달
        	return "/user/socialJoin.do?userId=" + kakaoId + "&email=" + kakaoEmail + "&loginMethod=kakao";
        }
    }

}
