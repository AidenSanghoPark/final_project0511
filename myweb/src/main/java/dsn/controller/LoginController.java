package dsn.controller;

import java.util.*;

import java.util.regex.Matcher;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springframework.web.util.WebUtils;

import dsn.member.model.*;

@Controller
public class LoginController {
	
	@Autowired
	private MemberService memberService;
	
	
	
	@RequestMapping(value="/login.do",method= RequestMethod.GET)
	public String loginView(@ModelAttribute("loginVO")LoginDTO loginVO,HttpServletRequest request,Model model) throws Exception{
		Map<String, ?> inputFlashMap = RequestContextUtils.getInputFlashMap(request);
		if(null != inputFlashMap) {
			model.addAttribute("msg",(String) inputFlashMap.get("msg"));
		}
		return "/login";
	}
	
//	@RequestMapping(value = "/login.do",method = RequestMethod.GET)
//	public void login() {
//	}
//	
	@RequestMapping(value="/loginPost.do" , method= RequestMethod.POST)
	public void loginPost(LoginDTO ldto, Model model, HttpSession session)throws Exception{
		
		MemberDTO memberVO = memberService.login(ldto);
		if( memberVO == null || ldto.getU_pwd()==memberVO.getU_pwd()) {
			return;
		}
		
		
		model.addAttribute("user", memberVO);
		System.out.println(ldto.isUseCookie());
		if(ldto.isUseCookie()) {
			int amount = 60*60*24*7;
			Date sessionLimit = new Date(System.currentTimeMillis() + (1000*amount));
			memberService.autoLogin(session.getId(),memberVO.getU_id(), sessionLimit);
		
		}
		
	}
	
//	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
//	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception{
//		session.removeAttribute("login");
//		session.invalidate();
//		
//		Cookie loginCookie = WebUtils.getCookie(request,"loginCookie");
//		if (loginCookie != null) {
//			loginCookie.setPath("/");
//			loginCookie.setMaxAge(0);
//			
//			response.addCookie(loginCookie);
//		}
//		return "/index";
//		
//	}
	
	@RequestMapping(value="/logout.do")
    public String logout(HttpSession session,HttpServletRequest request, HttpServletResponse response) {
         
        Object obj = session.getAttribute("login");
        if ( obj != null ){
            MemberDTO vo = (MemberDTO)obj;
            // null이 아닐 경우 제거
            session.removeAttribute("login");
            session.invalidate(); // 세션 전체를 날려버림
            //쿠키를 가져와보고
            Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
            if ( loginCookie != null ){
                // null이 아니면 존재하면!
                loginCookie.setPath("/");
                // 쿠키는 없앨 때 유효시간을 0으로 설정하는 것 !!! invalidate같은거 없음.
                loginCookie.setMaxAge(0);
                // 쿠키 설정을 적용한다.
                response.addCookie(loginCookie);
                 
                // 사용자 테이블에서도 유효기간을 현재시간으로 다시 세팅해줘야함.
                Date date = new Date(System.currentTimeMillis());
                memberService.autoLogin(vo.getU_id(),session.getId(), date);
            }
        }
        return "/index"; 
    }
	
	
	 


}
