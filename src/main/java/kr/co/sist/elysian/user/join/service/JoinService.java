package kr.co.sist.elysian.user.join.service;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.nio.charset.StandardCharsets;
import java.util.HashMap;

import kr.co.sist.elysian.user.login.model.domain.UserDomain;
import kr.co.sist.elysian.user.login.model.vo.UserVO;
import kr.co.sist.elysian.user.login.repository.UserDAO;

@Service
public class JoinService {

    @Autowired(required = false)
    private UserDAO uDAO;

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

    // 회원 아이디 중복 확인
    public UserDomain searchUser(UserVO uVO) {
        UserDomain udm = null;
        try {
            udm = uDAO.selectUser(uVO);
        } catch (PersistenceException pe) {
            pe.printStackTrace();
        }
        return udm;
    }

    // 회원 이메일 중복 확인
    public UserDomain searchEmail(UserVO uVO) {
        UserDomain udm = null;
        try {
            udm = uDAO.selectEmail(uVO);
        } catch (PersistenceException pe) {
            pe.printStackTrace();
        }
        return udm;
    }

    // 회원 가입
    public int addUser(UserVO uVO) throws PersistenceException {
        PasswordEncoder pwEncoder = new BCryptPasswordEncoder();
        try {
            // 비밀번호 암호화
            String encodedPw = pwEncoder.encode(uVO.getUserPw());
            uVO.setUserPw(encodedPw);

            // nationCode 값 변경
            String nationCode = uVO.getNationCode();
            if (nationCode != null && !nationCode.isEmpty()) {
                uVO.setNationCode("10_" + nationCode);
            }

            // userName 값 변경
            String userName = uVO.getUserName();
            String eName1 = uVO.getEName1();
            String eName2 = uVO.getEName2();
            if (userName == null || userName.isEmpty()) {
                uVO.setUserName(eName2 + " " + eName1);
            }

            // 회원 정보 저장
            int cnt = uDAO.insertUserInfo(uVO);
            return cnt;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("회원가입 중 오류가 발생했습니다.");
        }
    }

    // 회원가입 문자 인증
    private void certifiedPhoneNumber(String userPhone, int randomNumber) {
        initMessageService(); // Ensure messageService is initialized

        Message message = new Message();
        message.setFrom("01027345305");
        message.setTo(userPhone);
        message.setText("[Elysian] 인증번호는 [" + randomNumber + "] 입니다.");

        try {
            SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
            System.out.println("Response: " + response);
        } catch (Exception e) {
            System.out.println("Exception: " + e.getMessage());
        }
    }

    private int generateRandomNumber() {
        return (int) ((Math.random() * (999999 - 100000 + 1)) + 100000); // 6자리 난수 생성
    }

    public String sendSMS(String userPhone) {
        int randomNumber = generateRandomNumber();
        certifiedPhoneNumber(userPhone, randomNumber);
        return Integer.toString(randomNumber);
    }
}
