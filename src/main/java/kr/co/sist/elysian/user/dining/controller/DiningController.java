package kr.co.sist.elysian.user.dining.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.sist.elysian.user.dining.model.domain.DiningDomain;
import kr.co.sist.elysian.user.dining.model.domain.DiningOptionDomain;
import kr.co.sist.elysian.user.dining.service.DiningService;

@Controller("userDiningController")
@RequestMapping("/user")
public class DiningController {

	@Autowired(required = false)
	private DiningService userDiningService;
	
	//화면접속시 랜덤한 다이닝 정보 가져오기 
	@GetMapping("/dining.do")
	public String searchRandomDiningDetail(Model model) {
		
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
		
	} // searchAllDiningList
	
	//select 요소에 해당하는 다이닝 정보 가져오기
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
	}
	
	@GetMapping("/dining_step0.do")
	public String diningBookingStep0(@RequestParam("diningId")String diningId,@RequestParam(name = "table", defaultValue =  "AVAILABLE_HALL_TABLE" )String table ,Model model) {
		ObjectMapper mapper = new ObjectMapper();
		DiningDomain dDomain = userDiningService.searchOneDiningDetail(diningId);
		
		String diningJson = "";
		try {
			diningJson = mapper.writeValueAsString(dDomain);
			model.addAttribute("diningJson",diningJson);
		}catch(Exception e){
			e.printStackTrace();
		}
		// 현재 날짜 구하기 (시스템 시계, 시스템 타임존) 
		LocalDate date = LocalDate.now();
        Map<String, Object> diningData = userDiningService.setDiningData(diningId, date, table,2);
        model.addAttribute("openTime",dDomain.getOpenTime());
        model.addAttribute("closeTime",dDomain.getCloseTime());
        model.addAttribute("diningSeatsData",diningData);
        model.addAttribute("diningId", diningId);
        return "user/resve/dining/step1";
	} // diningBookingStep0
	
	// AJAX 요청을 처리하는 메소드
    @PostMapping("/getTimeSlots.do")
    @ResponseBody
    public Map<String, Object> getTimeSlots(@RequestParam("diningId") String diningId,
                                           @RequestParam("selectedDate") String strSelectedDate,
                                           @RequestParam("table") String table,
                                           @RequestParam("personCnt") String strPersonCnt) {
       //JSON은 문자열이기때문에 알맞는 데이터형식으로 변환
    	int personCnt = Integer.parseInt(strPersonCnt);
       String rpStrSelectedDate = strSelectedDate.replace('.', '-');
       LocalDate selectedDate =  LocalDate.parse(rpStrSelectedDate,DateTimeFormatter.ISO_DATE);
    	return userDiningService.setDiningData(diningId, selectedDate,table,personCnt);
    }
	
	
	@PostMapping("/dining_step1.do")
	 String diningBookingStep1(
		        @RequestParam("visitDate") String visitDate,
		        @RequestParam("visitTime") String visitTime,
		        @RequestParam("personCount")String strPersonCount,
		        @RequestParam("diningId") String diningId,
		        Model model) {
			
			//인원수 정수 변환
			int personCount = Integer.parseInt(strPersonCount);
			System.out.println(visitDate);
			System.out.println(visitTime);
			System.out.println(strPersonCount);
			System.out.println(diningId);
		    // 다이닝 상세 정보 가져오기
		    DiningDomain diningDetail = userDiningService.searchOneDiningDetail(diningId);
		    
		    // 데이터를 Model에 추가
		    model.addAttribute("visitDate", visitDate);
		    model.addAttribute("visitTime", visitTime);
		    model.addAttribute("personCount", personCount);
		    model.addAttribute("diningId", diningId);
		    model.addAttribute("diningDetail", diningDetail); // 다이닝 상세 정보 추가
		return "user/resve/dining/step2";
	} // diningBookingStep1
	
	

} // class