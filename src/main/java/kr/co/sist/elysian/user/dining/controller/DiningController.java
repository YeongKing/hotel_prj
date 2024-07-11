package kr.co.sist.elysian.user.dining.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.sist.elysian.user.dining.model.domain.DiningDomain;
import kr.co.sist.elysian.user.dining.model.domain.DiningOptionDomain;
import kr.co.sist.elysian.user.dining.model.vo.DiningResInfoVO;
import kr.co.sist.elysian.user.dining.model.vo.DiningResVO;
import kr.co.sist.elysian.user.dining.model.vo.DiningSeatsVO;
import kr.co.sist.elysian.user.dining.service.DiningService;

@Controller("userDiningController")
@RequestMapping("/user")
public class DiningController {

	@Autowired(required = false)
	private DiningService userDiningService;

	
	/**
	 * 화면접속시 랜덤한 다이닝 정보 가져오기 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/dining.do" , method = {RequestMethod.GET, RequestMethod.POST})
	public String searchRandomDiningDetail(Model model) {


		//jackson에 값 설정
		ObjectMapper mapper = new ObjectMapper();
		DiningDomain dDomian = userDiningService.searchRandomDiningDetail();
		List<DiningOptionDomain> dOptionDomain = userDiningService.searchAllDiningName();
		model.addAttribute("diningList",dOptionDomain);
		String diningJson = "";
		try {
			diningJson = mapper.writeValueAsString(dDomian);
			model.addAttribute("diningJson",diningJson);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "user/resve/dining/step0";
		
	}//searchAllDiningList
	
	
	
	/**
	 * select 요소에 해당하는 다이닝 정보 가져오기
	 * @param diningId
	 * @return
	 */
	@ResponseBody
	@GetMapping("/selectDining.do")
	public String searchOneDiningDetail(@RequestParam("diningId")String diningId) {
		ObjectMapper mapper = new ObjectMapper();
		DiningDomain dDomain = userDiningService.searchOneDiningDetail(diningId);
		
		String diningJson = "";
		try {
			diningJson = mapper.writeValueAsString(dDomain);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		
		
		return diningJson;
	}//searchOneDiningDetail
	
	
	
	/**
	 * reserve/dining/step1.jsp의 초기화면 로드에 필요한 데이터를 가져오는 메서드
	 * 해당시간, 인원, 날짜에 좌석이 있는 유무를 판단한다.
	 * @param drVO
	 * @param table
	 * @param model
	 * @param session
	 * @return
	 */
	@GetMapping("/dining_step0.do")
	public String diningBookingStep0(@ModelAttribute DiningResVO drVO,
			@RequestParam(name = "table", defaultValue =  "AVAILABLE_HALL_TABLE" )String table ,
			Model model,
			HttpSession session) {
		
		//jackson
		ObjectMapper mapper = new ObjectMapper();
		
		//다이닝 상세정보 가져오기
		DiningDomain dDomain = userDiningService.searchOneDiningDetail(drVO.getDiningId());
		
		
		String diningJson = "";
		try {
			diningJson = mapper.writeValueAsString(dDomain);
			model.addAttribute("diningJson",diningJson);
		}catch(Exception e){
			e.printStackTrace();
		}
	

	   session.setAttribute("drVO", drVO);
		// 현재 날짜 구하기 (시스템 시계, 시스템 타임존) 
		LocalDate date = LocalDate.now();
        
		Map<String, Object> diningData = userDiningService.setDiningData(drVO.getDiningId(), date, table,2);
        
        //모델에 추가
        model.addAttribute("openTime",dDomain.getOpenTime());
        model.addAttribute("closeTime",dDomain.getCloseTime());
        model.addAttribute("diningSeatsData",diningData);
        return "user/resve/dining/step1";
	}//diningBookingStep0
	
	
	
	/**
	 * AJAX 요청을 처리하는 메소드
	 * @param strSelectedDate
	 * @param table
	 * @param strPersonCnt
	 * @param session
	 * @return
	 */
    @PostMapping("/getTimeSlots.do")
    @ResponseBody
    public Map<String, Object> getTimeSlots(
                                           @RequestParam("selectedDate") String strSelectedDate,
                                           @RequestParam("table") String table,
                                           @RequestParam("personCnt") String strPersonCnt,
                                           HttpSession session) {
		DiningResVO drVO = (DiningResVO) session.getAttribute("drVO");
    	String diningId = drVO.getDiningId();
    	int personCnt = Integer.parseInt(strPersonCnt);
    	
    	//날짜 형식 '-'로 변경
       String rpStrSelectedDate = strSelectedDate.replace('.', '-');
       LocalDate selectedDate =  LocalDate.parse(rpStrSelectedDate,DateTimeFormatter.ISO_DATE);
    	return userDiningService.setDiningData(diningId, selectedDate,table,personCnt);
   
    }//getTimeSlots
    
     
	
	 /**
	  * reserve/dining/step2.jsp 화면 로드에 필요한 데이터를 가져오는 메서드
	  * @param drVO1
	  * @param dsVO1
	  * @param model
	  * @param session
	  * @return
	  */
	 @PostMapping("/dining_step1.do")
	 public String diningBookingStep1(
		        @ModelAttribute DiningResVO drVO1, 
		        @ModelAttribute DiningSeatsVO dsVO1,
		        Model model,
		        HttpSession session) {
			
			DiningResVO drVO = (DiningResVO) session.getAttribute("drVO");
			DiningSeatsVO dsVO = new DiningSeatsVO();
			DiningResInfoVO drInfoVO = new DiningResInfoVO();
			
			// 다이닝 상세 정보 가져오기
		    DiningDomain diningDetail = userDiningService.searchOneDiningDetail(drVO.getDiningId());
		    
		    //예약 VO에 값넣기
		    drVO.setVisitPeople(drVO1.getVisitPeople());
		    drVO.setVisitDate(drVO1.getVisitDate());		    
		    drVO.setVisitTime(drVO1.getVisitTime());
		    
		    //좌석 VO에 값넣기
		    dsVO.setDiningTime(dsVO1.getDiningTime());

		    //예약정보 VO에 값넣기
		    drInfoVO.setDiningName(diningDetail.getDiningName());
		    drInfoVO.setDiningImg(diningDetail.getDiningImg());
		    drInfoVO.setLocation(diningDetail.getLocation());
		    drInfoVO.setVisitDate(drVO1.getVisitDate());
		    drInfoVO.setVisitDateTime(drVO1.getVisitTime());
		    drInfoVO.setVisitPeople(drVO1.getVisitPeople());
		    
		    //예약자 정보 가져오기(이름,번호,이메일)
		    //세션에 있는 아이디 가져오기
		    String userIdSession = (String)session.getAttribute("userId");		   
		    //세션이 널이면 임의의 값 집어넣기 (수정필요)
		    
		    //예약 VO 에 값 설정
		    DiningResVO drVOInfo  =  userDiningService.searchUserName(userIdSession);
		    drVO.setUserId(drVOInfo.getUserId());
		   	drVO.setVisitorName(drVOInfo.getName());
		   	drVO.setPhone(drVOInfo.getPhone());
		   	drVO.setEmail(drVOInfo.getEmail());
		   	
		   	
		    //다시 session에 값설정
		   	session.setAttribute("drVO", drVO);
		    session.setAttribute("dsVO", dsVO);
		    session.setAttribute("drInfoVO", drInfoVO);
		    // 데이터를 Model에 추가
		    model.addAttribute("diningDetail", diningDetail); // 다이닝 상세 정보 추가
		return "user/resve/dining/step2";
	} // diningBookingStep1
	
	 
	 
	 /**
	  * 입력된 예약정보을 가져와 예약진행하는 메서드
	  * @param requestData
	  * @param session
	  * @return
	  */
	 @ResponseBody
	 @PostMapping(value="/insertDiningRes.do")
	 public String insertDiningRes( @RequestBody Map<String, String> requestData,
             HttpSession session) {
		
		 DiningResVO drVO = (DiningResVO) session.getAttribute("drVO"); 
		 DiningResInfoVO drInfoVO = (DiningResInfoVO) session.getAttribute("drInfoVO");
		 //JSON 데이터 자바객체 저장
		 String payNum = requestData.get("payNum");
		 String diningResStatus = requestData.get("diningResStatus");
		 String guestName = requestData.get("guestName");
		 String guestEmail = requestData.get("bookerEmail");
		 String guestPhone = requestData.get("guestPhone");
		 String bookerName = requestData.get("bookerName");
		 String bookerPhone = requestData.get("bookerPhone");
		 String strTotalPrice = requestData.get("totalPrice");
		 String requests = requestData.get("requests");
		 
		 //요구사항이 null이면 공백으로 넣는다
		 if(requests == null) {
			 requests = "";
		 }
			 //DB에 넣기전 날짜값 변경하기
		    String beforeVisitDate = drVO.getVisitDate();
		    String visitDate = beforeVisitDate.replace('.', '-');
		    
		    //예약금 정수변환
		    int totalPrice = Integer.parseInt(strTotalPrice);
		    
		    //예약 VO에 값넣기
		    drVO.setVisitorRequest(requests);
		    drVO.setVisitDate(visitDate);
			drVO.setPayNum(payNum);
			drVO.setDiningResStatus(diningResStatus);
			drVO.setEmail(guestEmail);
			drVO.setPhone(guestPhone);
			
			
			//예약 정보 VO에 값넣기
		    drInfoVO.setPayNum(payNum);
		    drInfoVO.setTotalPrice(totalPrice);
		    drInfoVO.setBookerName(bookerName);
		    drInfoVO.setBookerPhone(bookerPhone);
		    drInfoVO.setBookerEmail(guestEmail);
		    drInfoVO.setVistorName(guestName);
		    drInfoVO.setVisitorPhone(guestPhone);
		    drInfoVO.setRequests(requests);

		    //세션에 넣기
		    session.setAttribute("drVO",drVO);
			session.setAttribute("drInfoVO", drInfoVO);
			//예약 결과
			String resResult = userDiningService.saveDiningReservation(drVO);

			//JSON에  결과 문자열 저장 (성공,실패)
			JSONObject jsonObj = new JSONObject();
			
			jsonObj.put("result", resResult);
			

			// 저장된 예약 ID 반환
	        return jsonObj.toJSONString();
	 
	 }//insertDiningRes
	 
	 
	 
	 /**
	  * 예약 유효성 검사 메서드
	  * @param table
	  * @param session
	  * @param model
	  * @return
	  */
	 @ResponseBody
	 @PostMapping(value="/diningResveValid.do", produces="application/json; charset=UTF-8")
	 public int resveValid(@RequestParam("table")String table,HttpSession session, Model model) {
		
		 //세션에서 값 가져오기
		 DiningSeatsVO dsVO = (DiningSeatsVO) session.getAttribute("dsVO");
		 DiningResVO drVO = (DiningResVO) session.getAttribute("drVO");
		 
		 //필요한 테이블 계산
		 int visitPeople = drVO.getVisitPeople();
		 int tableCount = (int) Math.ceil((double) visitPeople / 4);
		 
		 //날짜 '.' -> '-' 형식변환
		 String visitDate = drVO.getVisitDate().replace(".", "-");
		 
		 //VO에 값 저장
		 dsVO.setTableCount(tableCount);
		 dsVO.setTable(table);
		 dsVO.setDiningId(drVO.getDiningId());
		 dsVO.setDiningDate(visitDate);
		 
		 //세션에 다시 저장
		 session.setAttribute("dsVO", dsVO);
		 
		 System.out.println("===========" +dsVO.toString());
		 
		 int resultDining =  userDiningService.reserveValid(dsVO);
		 
		 return resultDining;
	 
	 }//resveValid
	 
	 
	 
	 /**
	  * 예약완료 후 예약결과 페이지 이동하는 메서드
	  * @return
	  */
	 @GetMapping("/complete.do")
	 public String complete() {
		 
		 return "user/resve/dining/complete";
	 }//complete
	 

	
} // class