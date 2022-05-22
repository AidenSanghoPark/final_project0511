package dsn.member.interceptor;

import java.io.PrintWriter;

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
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
        HttpSession httpSession = request.getSession();
        ModelMap modelMap = modelAndView.getModelMap();
        Object memberVO =  modelMap.get("user");
        
        if (memberVO != null) {
            httpSession.setAttribute(LOGIN, memberVO);
            
            if(request.getParameter("useCookie")!=null) {
            	Cookie loginCookie = new Cookie("loginCookie",httpSession.getId());
            	loginCookie.setPath("/");
            	loginCookie.setMaxAge(60*60*24*7);
            	response.addCookie(loginCookie);
            }
            
            Object destination = httpSession.getAttribute("destination");
            Object URL = httpSession.getAttribute("logUrl");
            String logUrl= (String) URL;
            System.out.println(logUrl.contains("logout.do"));
            System.out.println(logUrl.contains("loginPost.do"));
            if(logUrl.contains("logout.do")||logUrl.contains("loginPost.do")) {
            	response.sendRedirect(destination != null ? (String) destination : "index.do");
            }else {
            	response.sendRedirect(destination != null ? (String) destination : (String) URL);
            }
            
            
        }else {
        	
        	modelAndView.addObject("msg", "아이디 혹은 비밀번호가 일치하지 않습니다.");
        	modelAndView.addObject("gopage", "login.do");
        	modelAndView.setViewName("/member/loginMsg");
//        	response.setContentType("text/html; charset=UTF-8");
//
//            PrintWriter out = response.getWriter();
//
//            out.println("<script>alert('아이디 비밀번호가 일치하지 않습니다.'); history.go(-1);</script>");// <== 관리자 등급별로 메뉴 제어
//
//            out.flush();
        }
	}
	
	
}
