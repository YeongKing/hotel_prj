package kr.co.sist.elysian.admin.login.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

//1. HandlerInterceptor 구현
public class AdminInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		boolean flag = false;
		System.out.println("1. preHandle");

		//세션의 값 받기
		Object adminId = WebUtils.getSessionAttribute(request, "admin_id");
		System.out.println("세션 " + adminId);
		flag = adminId != null; //세션이 있다면 true, 없다면 false
		if( !flag ) { //세션이 없으면 로그인 폼으로 이동
			response.sendRedirect("http://localhost/hotel_prj/admin/adminlogin_frm.do");
		}//end if

		return flag; //true - 다음으로 진행, false - 멈춰
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("2. postHandle");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println("3. afterCompletion");
	}

}