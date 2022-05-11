package dsn.member.interceptor;

import javax.servlet.http.Cookie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import dsn.member.model.MemberDTO;
import dsn.member.model.MemberService;

@Service
public class AuthenticationInterceptor extends HandlerInterceptorAdapter{

	
	private MemberService memberService;
	
	public AuthenticationInterceptor(MemberService memberService) {
		super();
		this.memberService = memberService;
	}
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
       
            Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
            if ( loginCookie != null ){ 
                String session_id = loginCookie.getValue();
                
                System.out.println(session_id);
                
                MemberDTO userDTO = memberService.checkUserWithSessionKey(session_id);
                 
                System.out.println(userDTO.getU_id());
                if ( userDTO != null ){
                	HttpSession session = request.getSession();
                	session.setAttribute("login", userDTO);
                }
            }
        return true;
        
        
	}
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
}
