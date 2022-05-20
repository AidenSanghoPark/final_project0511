package dsn.member.interceptor;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import dsn.member.model.MemberDTO;

public class AuthInterceptor extends HandlerInterceptorAdapter{

	 private static final String LOGIN = "login";
	
	 private void saveDestination(HttpServletRequest request) {
	    	String uri = request.getRequestURI();
	    	String query = request.getQueryString();
	    	
	    	if(query == null || query.equals("null")) {
	    		query = "";
	    	}else {
	    		query = "?"+query;
	    	}
	    	
	    	if(request.getMethod().equals("GET")) {
	    		request.getSession().setAttribute("destination", uri + query);
	    	}
	    }
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
    	if(session.getAttribute(LOGIN) == null) {
    		saveDestination(request);
    		response.sendRedirect("login.do");
    				return false;
    	}
    	return true;
		
	
		
//		if(session.getAttribute(LOGIN) == null) {
//			
//			String uri = request.getRequestURI();
//			
//			String query = request.getQueryString();
//			
//			if(StringUtils.isNotEmpty(query)) {
//				
//				uri +="?"+query;
//				
//				session.setAttribute(ATTEMPTED, uri);
//				
//				response.sendRedirect("/login.do");
//			}
//		}
//	
//		return true;
	}
}
