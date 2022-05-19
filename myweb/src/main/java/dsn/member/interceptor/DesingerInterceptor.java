package dsn.member.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import dsn.member.model.MemberDTO;

public class DesingerInterceptor extends HandlerInterceptorAdapter{

	 
     
     
   
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		System.out.println("디자이너검증 인터셉터 작동");
		HttpSession session = request.getSession();
		Object obj=session.getAttribute("login");
		MemberDTO mdto = (MemberDTO) obj;
		ModelAndView mav= new ModelAndView();
		if(mdto.getU_type()!=2) {
			System.out.println("디자이너 컨트롤러 포스트 핸들러 작동");
//			Object URL = session.getAttribute("conUrl");
//	        String conUrl= (String) URL;
//	        System.out.println("conUrl="+URL);
//	        ModelAndView modelAndView=new ModelAndView();
//	        modelAndView.addObject("msg", "디자이너 회원만 참여 가능합니다.");
//	        modelAndView.addObject("gopage", URL);
//	        modelAndView.setViewName("/contest/contestMsg");
//			
			
            Object URL = session.getAttribute("logUrl");
            String logUrl= (String) URL;
//            System.out.println("logUrl="+URL);
//            response.sendRedirect((String) URL);
            
//            StringBuffer sb=new StringBuffer();
//    		
//    		sb.append("<script>alert('디자이너만 참여 가능합니다.'); location.href:'");
//    		sb.append(logUrl);
//    		sb.append("';</script>");
    		
	        System.out.println("dinter="+logUrl);
	        System.out.println(logUrl.contains("index.jsp")==true);
	        	if(logUrl.contains("index.jsp")){
	        		response.setContentType("text/html; charset=UTF-8");
	        		System.out.println("디자이너검증");
		            PrintWriter out = response.getWriter();

		            out.println("<script>alert('디자이너만 참여 가능합니다.'); history.back(-2);</script>");// <== 관리자 등급별로 메뉴 제어

		            out.flush();
	        	}else if(logUrl.contains("index.jsp")==false) {
	        		response.setContentType("text/html; charset=UTF-8");

		            PrintWriter out = response.getWriter();
		            System.out.println("디자이너검증2");
		            out.println("<script>alert('디자이너만 참여 가능합니다.'); history.back(-1);</script>");// <== 관리자 등급별로 메뉴 제어

		            out.flush();
	        	}
	            
			
			return false;
		}else {
			return true;
		}
    	
	}
	
	
	
	
}

