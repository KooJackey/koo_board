package com.pknu.bbs.aop;

import javax.inject.Named;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

import com.pknu.bbs.dao.BBSDao;
import com.pknu.bbs.service.LoginStatus;

@Named
@Aspect
public class LoginAutoAspect {	// 포인트 컷과 어드바이스를 메소드로 만든다
	// 포인트 컷
//	@Pointcut("execution(* com.pknu.bbs.BBSController.login(..))")
//	public void login(){}
	
	
	@Pointcut("execution(* com.pknu.bbs.controller.BBSController.writeForm(..))")
	public void writeForm(){}
	
	
//	@Around(value="login()")
//	public Object loginCheck(ProceedingJoinPoint pjt) {
//		return null;
//	}
	
	@Around(value="writeForm()")
	public Object writeLogin(ProceedingJoinPoint pjt) throws Throwable{
		HttpSession session = null;
		HttpServletResponse res = null;
		for(Object obj:pjt.getArgs()){
			if(obj instanceof HttpSession){
				session = (HttpSession)obj;
			}
			if(obj instanceof HttpServletResponse){
				res = (HttpServletResponse) obj;
			}
		}
		
		if(session.getAttribute("id")==null){
			res.sendRedirect("/bbs/loginForm.bbs");
		}
		Object result=pjt.proceed();
		
		return result;
	}
	
	// 어드바이스 (before, after, around 등)
//	@Before(value="test()") 
//	public void before(JoinPoint jp){
//		for(Object obj:jp.getArgs()){
//			if(obj instanceof Locale){	// 객체의 타입 비교
//				Locale lc = (Locale)obj;
//			}else if(obj instanceof Model){
//				System.out.println("모델");
//			}else if(obj instanceof HttpSession){
//				System.out.println("세션");
//			}
//		}
//		
//	}
//	@Around(value="test() || test()1")
//	public Object pknu(ProceedingJoinPoint pjt) throws Throwable{
//		long startTime = System.currentTimeMillis();
//		Object result=pjt.proceed();
//		long endTime= System.currentTimeMillis();
//		System.out.println("총시간은 :"+(endTime-startTime));
//		return result;
//	}
}
