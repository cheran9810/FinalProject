package web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class AdminInterceptor implements HandlerInterceptor{
	private static final Logger logger = LoggerFactory.getLogger(AdminInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			
			
			throws Exception {
		logger.info("인터셉터 시작");
		logger.info(" Request URI : " + request.getRequestedSessionId());
		HttpSession session = request.getSession(); // 세션을 가져와서
		
		if( session.getAttribute("login") == null ) { // 그거를 활용하는데
			logger.info(">>접속 불가 : 비 로그인 상태");
			
			response.sendRedirect("/interceptor/admin/fail"); //에러페이지
			return false;
			
		} else {
			logger.info(" >>로그인 상태");
			System.out.println(session.getAttribute("id"));
			if ( !"admin".equals(session.getAttribute("id"))) { // 저장된 세션이 없잖아요 admin 일시에
				logger.info(" >>접속 불가 : 일반 사용자 로그인");	
				response.sendRedirect("/interceptor/admin/fail"); //에러페이지
				return false;
			}
			
		}
		logger.info(" >> 정상 접근 : 관리자 로그인");
		return true;
	
	} 
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		logger.info("인터셉터 종료");
		
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
}
