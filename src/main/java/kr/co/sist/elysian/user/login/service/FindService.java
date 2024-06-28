package kr.co.sist.elysian.user.login.service;

import java.util.HashMap;
import java.nio.charset.StandardCharsets;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.co.sist.elysian.user.login.model.domain.UserDomain;
import kr.co.sist.elysian.user.login.model.vo.UserVO;
import kr.co.sist.elysian.user.login.repository.UserDAO;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import org.apache.ibatis.exceptions.PersistenceException;

@Service
public class FindService {

    @Autowired
    private UserDAO userDAO;
    
    @Value("sms.api.key")
    private String api_key;
    
    @Value("sms.api.secret.key")
    private String api_secret;

    public void certifiedPhoneNumber(String userPhone, int randomNumber) {
        Message coolsms = new Message(api_key, api_secret);

        HashMap<String, String> params = new HashMap<String, String>();
        System.out.println("Service : " + userPhone);
        params.put("to", userPhone);
        params.put("from", "01027345305");
        params.put("type", "SMS");
        params.put("text", "[Elysian] 인증번호는" + "[" + randomNumber + "]" + "입니다.");
        params.put("app_version", "test app 1.2");

        try {
            JSONObject obj = (JSONObject) coolsms.send(params);
            System.out.println("Response: " + new String(obj.toJSONString().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8));
        } catch (CoolsmsException e) {
            String errorMessage = new String(e.getMessage().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
            System.out.println("CoolsmsException: " + errorMessage);
            System.out.println("Error Code: " + e.getCode());
        } catch (Exception e) {
            String errorMessage = new String(e.getMessage().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
            System.out.println("Exception: " + errorMessage);
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
}
