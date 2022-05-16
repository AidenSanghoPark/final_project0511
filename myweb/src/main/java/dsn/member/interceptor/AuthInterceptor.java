package dsn.member.interceptor;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{

	 private static final String LOGIN = "login";
	
	 private void saveDestination(HttpServletRequest request) {
	    	String uri = request.getRequestURI();
	    	System.out.println("uri"+uri);
	    	String query = request.getQueryString();
	    	System.out.println("querys"+query);
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
		
		System.out.println("어스인터셉터 작동");
		HttpSession session = request.getSession();
    	System.out.println(session.getAttribute(LOGIN));
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
