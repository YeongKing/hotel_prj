package kr.co.sist.elysian.user.login.service;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.sist.elysian.user.login.model.domain.UserDomain;
import kr.co.sist.elysian.user.login.model.vo.UserVO;
import kr.co.sist.elysian.user.login.repository.UserDAO;
import org.apache.ibatis.exceptions.PersistenceException;
import org.json.simple.JSONObject;

import java.nio.charset.StandardCharsets;
import java.util.HashMap;

@Service
@PropertySource("classpath:memberAuth.properties")
public class FindService {

    @Autowired
    private UserDAO userDAO;
    
    @Value("${sms.api.key}")
    private String api_key;
    
    @Value("${sms.api.secret.key}")
    private String api_secret;
    
    private DefaultMessageService messageService;

    // Lazy initialization of messageService
    private void initMessageService() {
        if (this.messageService == null) {
            this.messageService = NurigoApp.INSTANCE.initialize(api_key, api_secret, "https://api.coolsms.co.kr");
        }
    }

    public void certifiedPhoneNumber(String userPhone, int randomNumber) {
        initMessageService(); // Ensure messageService is initialized

        Message message = new Message();
        message.setFrom("01027345305");
        message.setTo(userPhone);
        message.setText("[Elysian] 인증번호는 [" + randomNumber + "] 입니다.");

        try {
            SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
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
