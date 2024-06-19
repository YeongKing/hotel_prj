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
	private DiningService ds;
	
	//���̴� ����Ʈ �������� �޼���
	@GetMapping("/dining.do")
	public String searchDiningList(Model model) {
		List<DiningListDomain> list = ds.searchDiningList();
		model.addAttribute("diningList",list);

		
		return "admin/dining/dining";
	} //searchDiningList


	
	//���̴� �� ��ȸ �޼���
	@ResponseBody
	@PostMapping(value="/diningDetail.do", produces="application/json; charset=UTF-8")
	public DiningDomain selectDiningDetail(@RequestBody Map<String, Object> requestData, Model model) {
		 String diningId = (String) requestData.get("diningId");
	     DiningDomain dd = ds.searchDiningDetail(diningId);
	     
		return dd;
	}//selectDiningDetail
	
	
	//���̴� ��Ϲ�ư Ŭ���� ���������̵������� �޼���
	@ResponseBody
	@GetMapping("/addDiningModal.do")
	public String selectLastDiningId() {
		String nextDiningId = ds.searchLastDiningId();
		return nextDiningId;
	}//addDining
	
	
	//���̴� ��� �޼���
	@PostMapping("/addDining.do")
	@ResponseBody
	public boolean addDining(DiningVO dVO, Model model, HttpServletRequest request) throws IOException {
		    
		    File uploadRepository = new File("C:/dev/workspace/hotel_prj/src/main/webapp/util/dining_img");
		    //��ΰ� ���� �� ���ܸ� ������.
		    if (!uploadRepository.exists()) {
		    	throw new IOException("ã���� ���� ����Դϴ�");
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
		            .diningImg(updateDiningImg)
		            .diningComment(mr.getParameter("diningComment"))
		            .menu(mr.getParameter("menu"))
		            .build();
		    File tempFile = new File(uploadRepository.getAbsolutePath()+"/"+ updateDiningImg);
		    if(tempFile.length() > maxSize) { //���ε� ����
				tempFile.delete();
			}
		boolean isInserted = ds.registerDining(dVO);
	
		return isInserted;
	}//addDining
	
	@PostMapping("/updateDining.do")
	@ResponseBody
	public boolean updateDining(DiningVO dVO, HttpServletRequest request, Model model) throws IOException {
		
		 File uploadRepository = new File("C:/dev/workspace/hotel_prj/src/main/webapp/util/dining_img");
		 //��ΰ� ���� �� ���ܸ� ������.
		 if (!uploadRepository.exists()) {
		    	throw new IOException("ã���� ���� ����Դϴ�");
		    }
		 
		 int maxSize= 100*1024*1024;
		 MultipartRequest mr=new MultipartRequest(request,uploadRepository.getAbsolutePath(), maxSize, "UTF-8",new DefaultFileRenamePolicy());
		 
		 String updateDiningImg = mr.getFilesystemName("diningImg");
		 String existingDiningImg = mr.getParameter("existDiningImg");
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
		            .diningImg(updateDiningImg)
		            .diningComment(mr.getParameter("diningComment"))
		            .menu(mr.getParameter("menu"))
		            .build();
		    File tempFile = new File(uploadRepository.getAbsolutePath()+"/"+ updateDiningImg);
			if(tempFile.length() > maxSize) { //���ε� ����
				tempFile.delete();
			}

			//HashMap�� ���̵��, VO ���
			HashMap< String, Object> param = new HashMap<String, Object>();
			param.put("diningId", mr.getParameter("diningId"));
			param.put("dVO", dVO);
			boolean isUpdated = ds.modifyDining(param);
			
		return isUpdated;
	}//updateDining
	
	
		public String deleteDining(int diningId, Model model) {
			return "";
	}//deleteDining
	
	
	
	
} // class