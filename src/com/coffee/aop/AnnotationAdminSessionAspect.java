package com.coffee.aop;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.web.servlet.ModelAndView;



@Aspect
public class AnnotationAdminSessionAspect {
   // xml이 없기 때문에 위치(pointCut), 때(advice)를 자바 코드에서 지정해야 한다.

   @Pointcut("execution(public * com.coffee.controller.admin..*(..))")
   public void checkMember() {} // 아이디 역할
   
   //아래의 배열에 들어있는 요청 URL에 대해서는 세션 체크를 피해가자!!
   String[] exceptList= {
		"/admin/login",   
		"/admin/logout"      
   };

   @Around("checkMember()")
   public ModelAndView loginCheck(ProceedingJoinPoint joinPoint) throws Throwable {
      ModelAndView mav;
      HttpServletRequest request = null;
      String requestURL=null;
      int count=0; //명단에 존재할 경우 증가시킬 거임!!
      
      Object[] objArray = joinPoint.getArgs(); // 메서드 호출 시 전달된 매개변수를 반환
      for (Object obj : objArray) {// 모든 매개변수 조사
         if (obj instanceof HttpServletRequest) {
            request = (HttpServletRequest) obj;
            requestURL=request.getRequestURL().toString();
            for(int i=0;i<exceptList.length;i++) {
            	if(requestURL.endsWith(exceptList[i])) {
            		count++; //제외 명단 발견
            	}
            }    
         }
      }
      
     
      
      // 로그인이 필요한 메서드 호출시만 세션 체크!
      if (request != null && count<1) {
      //if (count<1) {
         if (request.getSession().getAttribute("admin")==null) {
           // viewName = "/admin/login/error";
            mav=new ModelAndView("/admin/login/error");
         } else {
           // viewName = (String)joinPoint.proceed();
            mav = (ModelAndView)joinPoint.proceed();
            String methodName = joinPoint.getSignature().getName();
          //  System.out.println("▶로그인 필요 ==== 호출된 원본메서드 : " + methodName + ", 메서드의 반환 값 : " + viewName);
         }
      } else {
    	
    	  mav = (ModelAndView)joinPoint.proceed();
//         viewName = (String) joinPoint.proceed();
         String methodName = joinPoint.getSignature().getName();
      //   System.out.println("▶로그인 불필요 ==== 호출된 원본메서드 : " + methodName + ", 메서드의 반환 값 : " + viewName);
           
      }

      return mav;
   }
}