package kr.co.sist.elysian.user.login.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.util.WebUtils;

//1. HandlerInterceptor 구현
public class UserInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		boolean flag = false;
		System.out.println("1. preHandle");

		//세션의 값 받기
		Object userId = WebUtils.getSessionAttribute(request, "userId");
		
		// 요청한 페이지로 이동하기 위해 세션에 URI 저장
		HttpSession session = request.getSession();
		String requestURI = request.getRequestURI();
		session.setAttribute("requestedURI", requestURI);
		
//		System.out.println("세션 " + userId);
		flag = userId != null; //세션이 있다면 true, 없다면 false
		if( !flag ) { //세션이 없으면 로그인 폼으로 이동
			response.sendRedirect("http://localhost/hotel_prj/user/login.do");
		}//end if

		return flag; //true - 다음으로 진행, false - 멈춰
	}

}