package com.pknu.bbs.interceptor;

import javax.inject.Named;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Named
public class SessionInterceptor extends HandlerInterceptorAdapter{

	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse res, Object handler,
			ModelAndView modelAndView) throws Exception {
		Object obj=modelAndView.getModel().get("result");
		if(obj!=null){
			String id=(String)modelAndView.getModel().get("id");
			req.getSession().setAttribute("id", id);
			String view=(String)modelAndView.getModel().get("view");
			res.sendRedirect("/bbs"+view);
		}
		
	}

	
	

}
