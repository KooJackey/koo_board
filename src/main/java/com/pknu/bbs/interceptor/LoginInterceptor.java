package com.pknu.bbs.interceptor;

import javax.inject.Named;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.javassist.expr.Handler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Named
public class LoginInterceptor extends HandlerInterceptorAdapter{
//
//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView mav) throws Exception {
//		request.getSession().setAttribute("writeForm", "ok");
//	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if((String)request.getSession().getAttribute("id")==null){
			request.getSession().setAttribute("writeForm", "ok");
			response.sendRedirect("/bbs/loginForm.bbs");
			return false;
		}
		return true;
	}
	
	

}
