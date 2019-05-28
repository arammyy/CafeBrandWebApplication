package com.coffee.aop;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.web.servlet.ModelAndView;



@Aspect
public class AnnotationAdminSessionAspect {
   // xml�� ���� ������ ��ġ(pointCut), ��(advice)�� �ڹ� �ڵ忡�� �����ؾ� �Ѵ�.

   @Pointcut("execution(public * com.coffee.controller.admin..*(..))")
   public void checkMember() {} // ���̵� ����
   
   //�Ʒ��� �迭�� ����ִ� ��û URL�� ���ؼ��� ���� üũ�� ���ذ���!!
   String[] exceptList= {
		"/admin/login",   
		"/admin/logout"      
   };

   @Around("checkMember()")
   public ModelAndView loginCheck(ProceedingJoinPoint joinPoint) throws Throwable {
      ModelAndView mav;
      HttpServletRequest request = null;
      String requestURL=null;
      int count=0; //��ܿ� ������ ��� ������ų ����!!
      
      Object[] objArray = joinPoint.getArgs(); // �޼��� ȣ�� �� ���޵� �Ű������� ��ȯ
      for (Object obj : objArray) {// ��� �Ű����� ����
         if (obj instanceof HttpServletRequest) {
            request = (HttpServletRequest) obj;
            requestURL=request.getRequestURL().toString();
            for(int i=0;i<exceptList.length;i++) {
            	if(requestURL.endsWith(exceptList[i])) {
            		count++; //���� ��� �߰�
            	}
            }    
         }
      }
      
     
      
      // �α����� �ʿ��� �޼��� ȣ��ø� ���� üũ!
      if (request != null && count<1) {
      //if (count<1) {
         if (request.getSession().getAttribute("admin")==null) {
           // viewName = "/admin/login/error";
            mav=new ModelAndView("/admin/login/error");
         } else {
           // viewName = (String)joinPoint.proceed();
            mav = (ModelAndView)joinPoint.proceed();
            String methodName = joinPoint.getSignature().getName();
          //  System.out.println("���α��� �ʿ� ==== ȣ��� �����޼��� : " + methodName + ", �޼����� ��ȯ �� : " + viewName);
         }
      } else {
    	
    	  mav = (ModelAndView)joinPoint.proceed();
//         viewName = (String) joinPoint.proceed();
         String methodName = joinPoint.getSignature().getName();
      //   System.out.println("���α��� ���ʿ� ==== ȣ��� �����޼��� : " + methodName + ", �޼����� ��ȯ �� : " + viewName);
           
      }

      return mav;
   }
}