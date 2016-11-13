package kr.kina.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class LoginInterceptor extends HandlerInterceptorAdapter{

	private static final Logger log = LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object Handler) throws Exception {
		
		HttpSession session = request.getSession(true);
		
		if (session.getAttribute("id") == null){
			log.info("Interceptor - Login Session Check : NULL");
			System.out.println("Login Sessio ID 없을 때  : " + session.getAttribute("id"));
			response.sendRedirect("/member/fLogin");
		}else if(session.getAttribute("id") != null){
			System.out.println("Login Sessio ID 존재할 때인데 : " + session.getAttribute("id"));
			log.info("Interceptor - Login Session Check : Exist");
		}
		
		return true;
	}
	
}
