package kr.co.sist.elysian.user.board.notice.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.sist.elysian.user.board.notice.model.domain.NoticeDomain;
import kr.co.sist.elysian.user.board.notice.model.vo.NoticeVO;
import kr.co.sist.elysian.user.board.notice.service.NoticeService;

@Controller("userNoticeController")
@RequestMapping("/user")
public class NoticeController {
	
	@Autowired(required = false)
	private NoticeService ns;
	
	
	
	@GetMapping("/notice.do")
	public String searchNoticeList(@ModelAttribute NoticeVO nVO,
            Model model) {
		
		/*
		 * if(nVO.getSearchCtgry()!=null) { nVO.setSearchCtgry(
		 * (nVO.getSearchCtgry()).substring(0, 3)); }
		 */
		
		if(nVO.getPage()==0) {
			nVO.setPage(1);
		}
		
//		System.out.println("============================================================================");
//		System.out.println("============================================================================");
//		System.out.println(nVO.getSearchCtgry());
//		System.out.println("page : "+nVO.getPage()+"/// searchCtgry : " + nVO.getSearchCtgry() + "/// searchDataValue :" + nVO.getSearchDataValue());
//		System.out.println("============================================================================");
//		System.out.println("============================================================================");
		
		List<NoticeDomain> list = ns.selectNoticeList(nVO);
		int page = ns.selectPage(nVO);
//		System.out.println("totalPage  : "+ page);
		
		model.addAttribute("noticeList",list);
		model.addAttribute("nVO",nVO);
		model.addAttribute("totalPage",page);


		
		return "user/board/notice";
		
	} // searchNoticeList
	
	
	@GetMapping("/noticeDetail.do")
	public String noticeDetail(@ModelAttribute NoticeVO nVO,@RequestParam(required = false)String num,
            Model model,HttpServletRequest request, HttpServletResponse response) {

		
		String noticeNum = nVO.getNoticeNum();
		
		




	  
	            Cookie cookie = null ;               // 기존에 존재하던 쿠키를 저장하는 변수
	            Cookie[] cookies = request.getCookies(); // 저장되있는 쿠키 싹 다 얻어오기

	            if ( cookies != null && cookies.length > 0 ) {    // 얻어온쿠키가 있을 경우
	                // 얻어온 쿠키중 이름이 "readNoticeNum" 가 있으면 얻어오기.
	                for ( Cookie c : cookies) {
	                    if ( c.getName().equals("readNoticeNum")) {
	                        cookie = c;
	                    }
	                }
	            }
	            int result=0;

	            if ( cookie == null ) {      // "readNoticeNum" 쿠키가 없을 경우
	                cookie = new Cookie("readNoticeNum",noticeNum+"");  
	                result = ns.updateViewCount(noticeNum);   // 조회수증가 서비스호출

	            }else { // 기존에 "readBoardNo" 쿠키가 있을 경우
	                //--> 쿠키에 저장된 값 뒤쪽에 현재 조회된 게시글 번호를 추가 
	                // 단, 기존 쿠키값에 중복되는 번호가 없어야한다 !!!

	                String[] temp = cookie.getValue().split("/");
	                // "readNoticeNum"  :  "1/2/11/10/20/300/1000"  == [1,2,11,20,300,1000]
	                List<String> list = Arrays.asList(temp);   //  배열 --> List 변환

	                // List.indexOf(Object) 
	                // -- List에서 Object 와 일치하는 부분의 인덱스 반환,  없으면 -1 

	                if ( list.indexOf( noticeNum+"") == -1 ) {  // 기존값에 같은글번호가 없다면 추가
	                    cookie.setValue( cookie.getValue() +"/"+ noticeNum );
	                    result = ns.updateViewCount(noticeNum);   // 조회수증가 서비스호출
	                }
	            }
	            if (result > 0) {
	                cookie.setPath(request.getContextPath());
	                cookie.setMaxAge(60 * 60 * 1);
	                response.addCookie(cookie);
	            }

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		if(nVO.getPage()==0) {
			nVO.setPage(1);
		}
		
//		System.out.println("============================================================================");
//		System.out.println("============================================================================");
//		System.out.println("page : "+nVO.getPage()+"/// searchCtgry : " + nVO.getSearchCtgry() + "/// searchDataValue :" + nVO.getSearchDataValue());
//		System.out.println("============================================================================");
//		System.out.println("============================================================================");
		
		NoticeDomain currentND = ns.selectNoticeDetail(nVO);
		NoticeDomain prevND = ns.selectPrevNotice(nVO);
		NoticeDomain nextND = ns.selectNextNotice(nVO);

		
//		System.out.println("============================================================================");
//		System.out.println("============================================================================");
		
		
//		System.out.println("nVO : " + nVO);
//		System.out.println("prevND : " + prevND);
//		System.out.println("nextND : " + nextND);
//		System.out.println("noticeDomain : " + currentND);
//		System.out.println("============================================================================");
//		System.out.println("============================================================================");
		int page = ns.selectPage(nVO);
//		System.out.println("totalPage  : "+ page);
		
		model.addAttribute("nVO",nVO);
		model.addAttribute("totalPage",page);
		model.addAttribute("prevND",prevND);
		model.addAttribute("nd",currentND);
		model.addAttribute("nextND",nextND);
		model.addAttribute("num",num);

		
		
		
		
		
		
		
		
		
		
		
		return "user/board/noticeDetail";
		
	} // noticeDetail

} // class