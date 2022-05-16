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
	        // login처리를 담당하는 사용자 정보를 담고 있는 객체를 가져옴
	        Object obj = session.getAttribute("login");
	         
	        if ( obj == null ){ // 로그인된 세션이 없는 경우...
	            // 우리가 만들어 논 쿠키를 꺼내온다.
	            Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
	            if ( loginCookie != null ){ // 쿠키가 존재하는 경우(이전에 로그인때 생성된 쿠키가 존재한다는 것)
	                // loginCookie의 값을 꺼내오고 -> 즉, 저장해논 세션Id를 꺼내오고
	                String sessionId = loginCookie.getValue();
	                // 세션Id를 checkUserWithSessionKey에 전달해 이전에 로그인한적이 있는지 체크하는 메서드를 거쳐서
	                // 유효시간이 > now() 인 즉 아직 유효시간이 지나지 않으면서 해당 sessionId 정보를 가지고 있는 사용자 정보를 반환한다.
	                MemberDTO userVO = memberService.checkUserWithSessionKey(loginCookie.getValue());
	                 
	                if ( userVO != null ){ // 그런 사용자가 있다면
	                    // 세션을 생성시켜 준다.
	                    session.setAttribute("login", userVO);
	                    return true;
	                }
	            }
	        }
	        return true;
	    }


		
}
