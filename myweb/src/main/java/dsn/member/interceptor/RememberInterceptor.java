package dsn.member.interceptor;

import javax.servlet.http.Cookie;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import dsn.member.model.*;

public class RememberInterceptor extends HandlerInterceptorAdapter{
	
	    private MemberService memberService;
	    
	    public RememberInterceptor(MemberService memberService) {
			super();
			this.memberService = memberService;
		}
	    
	    
//	    @Override
//	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//			
//			System.out.println("리멤버 인터셉터 작동");
//	        HttpSession httpSession = request.getSession();
//	        Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
//	        if (loginCookie != null) {
//	            MemberDTO memberVO = memberService.checkUserWithSessionKey(loginCookie.getValue());
//	            if (memberVO != null)
//	                httpSession.setAttribute("login", memberVO);
//	        }
//
//	        return true;
//	    }
	    @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	            throws Exception {
	         
	         
	        // session 객체를 가져옴
	        HttpSession session = request.getSession();
	        Object obj = session.getAttribute("login");
	         
	        if ( obj == null ){
	            Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
	            if ( loginCookie != null ){
	                String sessionId = loginCookie.getValue();
	                MemberDTO userVO = memberService.checkUserWithSessionKey(loginCookie.getValue());
	                 
	                if ( userVO != null ){
	                    session.setAttribute("login", userVO);
	                    return true;
	                }
	            }
	        }
	        return true;
	    }


		
}
