package dsn.member.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import dsn.member.model.MemberDTO;

public class ClientInterceptor extends HandlerInterceptorAdapter{

	 private static final String LOGIN = "login";
	
	
	 @Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
				throws Exception {
			
			System.out.println("디자이너검증 인터셉터 작동");
			HttpSession session = request.getSession();
			Object obj=session.getAttribute("login");
			MemberDTO mdto = (MemberDTO) obj;
			ModelAndView mav= new ModelAndView();
			if(mdto.getU_type()!=1) {
				
				String refererURL = request.getHeader("referer");
		        System.out.println(refererURL);
				
	            Object URL = session.getAttribute("logUrl");
	            String logUrl= (String) URL;
	            System.out.println("logUrl="+URL);
	            response.sendRedirect((String) URL);
	            
	           
//	            StringBuffer sb=new StringBuffer();
//	    		
//	    		sb.append("<script>alert('디자이너만 참여 가능합니다.'); location.href:'");
//	    		sb.append(logUrl);
//	    		sb.append("';</script>");
	    		
		        
		        
//		            response.setContentType("text/html; charset=UTF-8");
	//
//		            PrintWriter out = response.getWriter();
	//
//		            out.println("<script>alert('디자이너만 참여 가능합니다.'); history.go(-1);</script>");// <== 관리자 등급별로 메뉴 제어
	//
//		            out.flush();
				
				return false;
			}else {
				return true;
			}
	    	
		}
}
