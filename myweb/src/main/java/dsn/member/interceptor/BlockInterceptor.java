package dsn.member.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import dsn.member.model.MemberDTO;

public class BlockInterceptor extends HandlerInterceptorAdapter{

	 
     
     
   
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Object obj=session.getAttribute("login");
		MemberDTO mdto = (MemberDTO) obj;
		ModelAndView mav= new ModelAndView();
		
		if("Y".equals(mdto.getU_block())) {

    		
	        		response.setContentType("text/html; charset=UTF-8");
		            PrintWriter out = response.getWriter();

		            out.println("<script>alert('이용정지 회원입니다.'); location.href='index.do';</script>");// <== 관리자 등급별로 메뉴 제어

		            out.flush();
	        
	            
			
			return false;
		}else {
			return true;
		}
    	
	}
	
	
	
	
}


