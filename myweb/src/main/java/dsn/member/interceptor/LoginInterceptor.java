package dsn.member.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	 private static final String LOGIN = "login";
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("loginter");
		HttpSession session = request.getSession();
		
		if(session.getAttribute(LOGIN) != null) {
			System.out.println("인터셉터가 세션에 남아있 던 세션을 제거했습니다.");
			session.removeAttribute(LOGIN);
		}
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("로그인 인터셉터 포스트 핸들 작동");
		
        HttpSession httpSession = request.getSession();
        ModelMap modelMap = modelAndView.getModelMap();
        Object memberVO =  modelMap.get("user");
        
        System.out.println("loginter post mvo="+memberVO);
        
        System.out.println("loginter copkie="+request.getParameter("useCookie"));
        
        if (memberVO != null) {
            httpSession.setAttribute(LOGIN, memberVO);
            
            if(request.getParameter("useCookie")!=null) {
            	Cookie loginCookie = new Cookie("loginCookie",httpSession.getId());
            	loginCookie.setPath("/");
            	loginCookie.setMaxAge(60*60*24*7);
            	response.addCookie(loginCookie);
            }
            
            Object destination = httpSession.getAttribute("destination");
            Object URL = httpSession.getAttribute("URL");
            response.sendRedirect(destination != null ? (String) destination : "index.do");
        }
		
//        HttpSession httpSession = request.getSession();
//        ModelMap modelMap = modelAndView.getModelMap();
//        Object memberVO =  modelMap.get("user");
//        System.out.println("loginter memberVO"+memberVO);
//        
//        if (memberVO != null) {
//        	
//            System.out.println("new login success");
//            httpSession.setAttribute(LOGIN, memberVO);
//            
//            Object destination = httpSession.getAttribute("destination");
//            System.out.println("loginter destination"+destination);
//            Object URL = httpSession.getAttribute("URL");
//            System.out.println("loginter URL"+URL);
//            response.sendRedirect(destination != null ? (String) destination : "index.do");
//        }
	}
	
	
}
