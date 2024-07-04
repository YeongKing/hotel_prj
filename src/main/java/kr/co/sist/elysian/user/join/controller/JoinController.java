package kr.co.sist.elysian.user.join.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sist.elysian.user.join.service.JoinService;
import kr.co.sist.elysian.user.login.model.domain.UserDomain;
import kr.co.sist.elysian.user.login.model.vo.UserVO;

@Controller("userJoinController")
@RequestMapping("/user")
public class JoinController {
	
	@Autowired(required = false)
	private JoinService js;
	
	@GetMapping("/join.do")
	public String joinFrm() {
		
		return "user/join/joinIntro";
		
	} // joinFrm
	
	//회원 아이디 중복 확인
	@PostMapping("/chk_id.do")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> checkDupId(@RequestParam("userId") String userId) {
        Map<String, Object> result = new HashMap<>();
        try {
            UserVO userVO = new UserVO();
            userVO.setUserId(userId);
            
            UserDomain userDomain = js.searchUser(userVO);
            if (userDomain == null) {
                result.put("statusR", 200);
                result.put("codeR", "S00000");
                result.put("messageR", "사용가능한 ID입니다.");
            } else {
                result.put("statusR", 400);
                result.put("codeR", "E00001");
                result.put("messageR", "이미 사용중인 ID입니다.");
            }
        } catch (Exception e) {
            result.put("statusR", 500);
            result.put("codeR", "E00002");
            result.put("messageR", "관리자에게 문의하세요.");
        }
        return new ResponseEntity<>(result, HttpStatus.OK);
    }//checkDupId
	
	//회원 이메일 중복 확인
	@PostMapping("/chk_email.do")
	@ResponseBody
    public Map<String, Object> checkDupEmail(@ModelAttribute UserVO uVO) {
        Map<String, Object> result = new HashMap<>();
        try {
            UserDomain userDomain = js.searchEmail(uVO);
            if (userDomain == null) {
                result.put("statusR", 200);
                result.put("codeR", "S00000");
            } else {
                result.put("statusR", 400);
            }
        } catch (Exception e) {
            result.put("statusR", 500);
            result.put("messageR", "관리자에게 문의하세요.");
        }
        return result;
    }
	
	//회원 가입
	@PostMapping("/joinInsert.do")
	@ResponseBody
	public Map<String, Object> addUser(@ModelAttribute UserVO uVO) {
		System.out.println("---------------------"+uVO);
	    Map<String, Object> resultMap = new HashMap<>();
	    try {
	        int cnt = js.addUser(uVO);
	        if (cnt > 0) {
	            resultMap.put("statusR", 200);
	        } else {
	            resultMap.put("statusR", 500);
	            resultMap.put("codeR", "E0002");
	            resultMap.put("messageR", "회원가입에 실패했습니다.");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        resultMap.put("statusR", 500);
	        resultMap.put("codeR", "E0001");
	        resultMap.put("messageR", "회원가입 중 오류가 발생했습니다.");
	    }
	    return resultMap;
	}//addUser
	
	//회원 가입 문자 인증
	@PostMapping("/sendSMS.do")
	public ResponseEntity<Map<String, String>> sendSMS(@RequestParam String userPhone) {
        Map<String, String> response = new HashMap<>();
        try {
            String randomNumber = js.sendSMS(userPhone);
            response.put("status", "success");
            response.put("code", randomNumber);
        } catch (Exception e) {
            response.put("status", "fail");
        }
        return ResponseEntity.ok(response);
    }
	
	//회원 가입 완료 페이지로 이동
	@PostMapping("/joinComplete.do")
	public String joinComplete(UserVO uVO, Model model) {
	    model.addAttribute("user", uVO); // 필요에 따라 사용자 정보를 모델에 추가
		return "user/join/joinComplete";
		
	} // joinComplete

} // class