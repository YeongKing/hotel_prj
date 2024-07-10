package kr.co.sist.elysian.user.login.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.google.api.client.auth.oauth2.TokenResponse;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeTokenRequest;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;

import kr.co.sist.elysian.user.login.model.domain.UserDomain;
import kr.co.sist.elysian.user.login.model.vo.UserVO;
import kr.co.sist.elysian.user.login.repository.UserDAO;

@Service
public class GoogleService {
	
	@Value("${google.client.id}")
	private String CLIENT_ID;

	@Value("${google.client.secret}")
	private String CLIENT_SECRET;
	
	@Autowired
	private UserDAO uDAO;

    @Autowired
    private LoginService ls;

    // 구글 ID 토큰 검증 및 사용자 정보 가져오기
    public Map<String, Object> getGoogleUserInfo(String code) throws Exception {
        JsonFactory jsonFactory = JacksonFactory.getDefaultInstance();
        NetHttpTransport transport = new NetHttpTransport();

        TokenResponse tokenResponse = new GoogleAuthorizationCodeTokenRequest(
                transport, jsonFactory, CLIENT_ID, CLIENT_SECRET, code, "http://localhost/hotel_prj/user/googleLogin.do")
                .execute();

        String idTokenString = tokenResponse.get("id_token").toString();
        GoogleIdToken idToken = GoogleIdToken.parse(jsonFactory, idTokenString);

        if (idToken != null) {
            GoogleIdToken.Payload payload = idToken.getPayload();
            return payload;
        } else {
            throw new Exception("Invalid ID token.");
        }
    }


    // 회원가입 정보를 데이터베이스에 저장하는 메소드
    public void registerUser(UserVO uVO) {
        try {
            uDAO.insertUserInfo(uVO);
        } catch (PersistenceException pe) {
            pe.printStackTrace();
            throw new RuntimeException("Failed to register user", pe);
        }
    }
    
    // 구글 사용자 정보를 확인하고 세션을 설정하는 메소드
    public String handleGoogleUserInfo(Map<String, Object> userInfo, HttpSession session) throws Exception {
        String googleId = userInfo.get("sub").toString();
        String googleEmail = userInfo.get("email").toString();
        UserDomain existingUser = uDAO.selectSocialLogin(googleId, googleEmail);
        if (existingUser != null) {
            session.setAttribute("userId", existingUser.getUserId());
            session.setAttribute("userName", existingUser.getUserName());
            ls.updateLoginDate(existingUser.getUserId());
            return "/user/index.do";
        } else {
            return "/user/socialJoin.do?userId=" + googleId + "&email=" + googleEmail + "&loginMethod=google";
        }
    }
}