package kr.co.sist.elysian.user.login.service;

import java.util.HashMap;
import java.util.Map;
import java.nio.charset.StandardCharsets;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.sist.elysian.user.login.model.domain.UserDomain;
import kr.co.sist.elysian.user.login.model.vo.UserVO;
import kr.co.sist.elysian.user.login.repository.UserDAO;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import org.apache.ibatis.exceptions.PersistenceException;

@Service
@PropertySource("classpath:memberAuth.properties")
public class FindService {

    @Autowired
    private UserDAO userDAO;
    
    @Value("${sms.api.key}")
    private String api_key;
    
    @Value("${sms.api.secret.key}")
    private String api_secret;
    
    public void certifiedPhoneNumber(String userPhone, int randomNumber) {
        Message coolsms = new Message(api_key, api_secret);

        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", userPhone);
        params.put("from", "01027345305");
        params.put("type", "SMS");
        params.put("text", "[Elysian] 인증번호는" + "[" + randomNumber + "]" + "입니다.");
        params.put("app_version", "test app 1.2");

        try {
            JSONObject obj = (JSONObject) coolsms.send(params);
        } catch (CoolsmsException e) {
            String errorMessage = new String(e.getMessage().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
        } catch (Exception e) {
            String errorMessage = new String(e.getMessage().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
        }
    }

    public int generateRandomNumber() {
        return (int)((Math.random() * (999999 - 100000 + 1)) + 100000); // 6자리 난수 생성
    }

    public String sendSMS(String userPhone) {
        int randomNumber = generateRandomNumber();
        certifiedPhoneNumber(userPhone, randomNumber);
        return Integer.toString(randomNumber);
    }

    public UserDomain getUserDetails(String userPhone) {
        UserVO userVO = new UserVO();
        userVO.setUserPhone(sanitizePhoneNumber(userPhone));
        try {
            return userDAO.selectPhone(userVO);  // DAO를 통해 사용자 정보 가져오기
        } catch (PersistenceException e) {
            e.printStackTrace();
            return null;
        }
    }

    public String sanitizePhoneNumber(String userPhone) {
        return userPhone.replaceAll("-", "");  // 하이픈 제거
    }
    
    public String modifyUserPw(UserVO uVO, String newLoginPassword) {
    	
        JSONObject jsonObj = new JSONObject();
        String resultCode = "ERROR";
        PasswordEncoder pwEncoder = new BCryptPasswordEncoder();
        
        try {
            UserDomain userDomain = userDAO.selectLogin(uVO);
            if (userDomain != null) {
                String encryptedPw = userDomain.getUserPw();
                String encodedNewPw = pwEncoder.encode(newLoginPassword);
                
                // 새 비밀번호가 기존 비밀번호와 동일한지 확인
                if (pwEncoder.matches(newLoginPassword, encryptedPw)) {
                    resultCode = "SAMEASCUR";
                } else {
                    uVO.setUserPw(encodedNewPw);
                    int updateResult = userDAO.updateUserPw(uVO);
                    if (updateResult > 0) {
                        resultCode = "SUCCESS";
                    }
                }
            } else {
                resultCode = "USERNOTFOUND";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        jsonObj.put("resultCode", resultCode);
        return jsonObj.toString();
    }

}
