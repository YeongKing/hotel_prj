package kr.co.sist.elysian.admin.dining.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.sist.elysian.admin.dining.model.domain.DiningDomain;
import kr.co.sist.elysian.admin.dining.model.domain.DiningListDomain;
import kr.co.sist.elysian.admin.dining.model.vo.DiningVO;
import kr.co.sist.elysian.admin.dining.service.DiningService;

@Controller("adminDiningController")
@RequestMapping("/admin")
public class DiningController {
	
	@Autowired(required = false)
	private DiningService adminDiningService;
	
	/**
	 * 다이닝 리스트 가져오는 메서드
	 * @param model
	 * @return
	 */
	@GetMapping("/dining.do")
	public String searchDiningList(Model model) {
		List<DiningListDomain> list = adminDiningService.searchDiningList();
		model.addAttribute("diningList",list);

		
		return "admin/dining/dining";
	} //searchDiningList


	
	/**
	 * 다이닝 상세 조회 메서드
	 * @param requestData
	 * @param model
	 * @return
	 */
	@ResponseBody
	@PostMapping(value="/diningDetail.do", produces="application/json; charset=UTF-8")
	public DiningDomain selectDiningDetail(@RequestBody Map<String, Object> requestData, Model model) {
		 String diningId = (String) requestData.get("diningId");
	     DiningDomain dd = adminDiningService.searchDiningDetail(diningId);
	     
		return dd;
	}//selectDiningDetail
	
	
	/**
	 * 다이닝 등록버튼 클릭시 마지막아이디가져오기 메서드
	 * @return
	 */
	@ResponseBody
	@GetMapping("/addDiningModal.do")
	public String selectLastDiningId() {
		String nextDiningId = adminDiningService.searchLastDiningId();
		return nextDiningId;
	}//addDining
	
	
	/**
	 * 다이닝 등록 메서드
	 * @param dVO
	 * @param model
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@PostMapping("/addDining.do")
	@ResponseBody
	public boolean addDining(DiningVO dVO, Model model, HttpServletRequest request) throws IOException {
		    
		    File uploadRepository = new File("C:/dev/workspace/hotel_prj/src/main/webapp/util/dining_img");
		    //경로가 없을 시 예외를 던진다.
		    if (!uploadRepository.exists()) {
		    	throw new IOException("찾을수 없는 경로입니다");
		    }
		    int maxSize= 100*1024*1024;
		    
		    MultipartRequest mr=new MultipartRequest(request,uploadRepository.getAbsolutePath(), maxSize, "UTF-8",new DefaultFileRenamePolicy());
		    String updateDiningImg = mr.getFilesystemName("diningImg");
		    
		    dVO = DiningVO.builder()
		            .diningId((mr.getParameter("diningId")))
		            .diningName(mr.getParameter("diningName"))
		            .diningType(mr.getParameter("diningType"))
		            .hallTable(Integer.parseInt(mr.getParameter("hallTable")))
		            .roomTable(Integer.parseInt(mr.getParameter("roomTable")))
		            .openTime(mr.getParameter("openTime"))
		            .closeTime(mr.getParameter("closeTime"))
		            .location(mr.getParameter("location"))
		            .deposit(Integer.parseInt(mr.getParameter("deposit")))
		            .diningImg(updateDiningImg)
		            .diningComment(mr.getParameter("diningComment"))
		            .menu(mr.getParameter("menu"))
		            .build();
		    File tempFile = new File(uploadRepository.getAbsolutePath()+"/"+ updateDiningImg);
		    if(tempFile.length() > maxSize) { //업로드 제한
				tempFile.delete();
			}
		boolean isInserted = adminDiningService.registerDining(dVO);
	
		return isInserted;
	}//addDining
	
	
	/**
	 * 
	 * @param dVO
	 * @param request
	 * @param model
	 * @return
	 * @throws IOException
	 */
	@PostMapping("/updateDining.do")
	@ResponseBody
	public boolean updateDining(DiningVO dVO, HttpServletRequest request, Model model) throws IOException {
		
		 File uploadRepository = new File("C:/dev/workspace/hotel_prj/src/main/webapp/util/dining_img");
		 //경로가 없을 시 예외를 던진다.
		 if (!uploadRepository.exists()) {
		    	throw new IOException("찾을수 없는 경로입니다");
		    }
		 
		 int maxSize= 100*1024*1024;
		 MultipartRequest mr=new MultipartRequest(request,uploadRepository.getAbsolutePath(), maxSize, "UTF-8",new DefaultFileRenamePolicy());
		 
		 String updateDiningImg = mr.getFilesystemName("diningImg");
		 String existingDiningImg = mr.getParameter("existDiningImg");
		 
		 //새로 등록한 이미지가 없을경우 본래 이미지로 대체
		 if(updateDiningImg == null && existingDiningImg != null) {
			 updateDiningImg = existingDiningImg;
		 }
		 dVO = DiningVO.builder()
		            .diningId(mr.getParameter("diningId"))
		            .diningName(mr.getParameter("diningName"))
		            .diningType(mr.getParameter("diningType"))
		            .hallTable(Integer.parseInt(mr.getParameter("hallTable")))
		            .roomTable(Integer.parseInt(mr.getParameter("roomTable")))
		            .openTime(mr.getParameter("openTime"))
		            .closeTime(mr.getParameter("closeTime"))
		            .location(mr.getParameter("location"))
		            .deposit(Integer.parseInt(mr.getParameter("depost")))
		            .diningImg(updateDiningImg)
		            .diningComment(mr.getParameter("diningComment"))
		            .menu(mr.getParameter("menu"))
		            .build();
		    File tempFile = new File(uploadRepository.getAbsolutePath()+"/"+ updateDiningImg);
			if(tempFile.length() > maxSize) { //업로드 제한
				tempFile.delete();
			}

			//HashMap에 아이디와, VO 담기
			HashMap< String, Object> param = new HashMap<String, Object>();
			param.put("diningId", mr.getParameter("diningId"));
			param.put("dVO", dVO);
			boolean isUpdated = adminDiningService.modifyDining(param);
			
		return isUpdated;
	}//updateDining
	
	
	/**
	 * 다이닝 삭제 메서드
	 * @param diningId
	 * @param model
	 * @return
	 */
	@ResponseBody
	@GetMapping("deleteDining.do")
	public boolean deleteDining(@RequestParam("diningId") String diningId, Model model) {
		boolean isDeleted = adminDiningService.removeDining(diningId);
		return isDeleted;
	}//deleteDining
	
	
	
	
} // class