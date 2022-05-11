package dsn.controller;

import java.util.*;

import java.util.regex.Matcher;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import dsn.member.model.*;

@Controller
public class LoginController {
	
	@Autowired
	private MemberService memberService;
	
	
	@RequestMapping(value = "/loginPage.do",method = RequestMethod.GET)
	public ModelAndView loginPageForm() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("member/login");
		return mav;
	}
	
	@RequestMapping(value="/loginPage.do",method=RequestMethod.POST)
    public String loginProcess(HttpSession session,MemberDTO dto, HttpServletResponse response){
	 
	 System.out.println("ckb="+dto.isAutologin());
        String returnURL = "";
        if ( session.getAttribute("login") != null ){
           
            session.removeAttribute("login"); 
        }
         
     
        MemberDTO vo = memberService.login(dto);
         
        if ( vo != null ){ 
            session.setAttribute("login", vo); 
            returnURL = "index";
            if (dto.isAutologin() == true){
                Cookie cookie = new Cookie("loginCookie", session.getId());
                cookie.setPath("/");
                int amount = 60 * 60 * 24 * 7;
                cookie.setMaxAge(amount);
                response.addCookie(cookie);
                
                Date sessionLimit = new Date(System.currentTimeMillis() + (1000*amount));
                
                memberService.autoLogin(session.getId(), sessionLimit, vo.getU_id());
            }else if(dto.isAutologin() == false) {
            	
            	Cookie cookie=new Cookie("loginCookie",session.getId());
            	cookie.setMaxAge(0);
            	response.addCookie(cookie);
            	
            }

        }else { 
            returnURL = "member/login";
        }
         
        return returnURL; 
    }
	
//	 @RequestMapping(value="/loginPage.do",method=RequestMethod.POST)
//	    public ModelAndView loginProcess(HttpSession session,MemberDTO dto, HttpServletResponse response){
//		 System.out.println(dto.getU_id());
//		 System.out.println(dto.getU_pwd());
//		 System.out.println("ckb="+dto.isAutologin());
//		 
//		 	ModelAndView mav=new ModelAndView();
//	        String returnURL = "";
//	        if ( session.getAttribute("login") != null ){
//	           
//	            session.removeAttribute("login"); 
//	        }
//	         
//	     
//	        MemberDTO vo = memberService.login(dto);
//	         System.out.println(vo.getU_id());
//	        if ( vo != null ){ 
//	            session.setAttribute("login", vo); 
//	            mav.addObject("login","index.do");
//	            mav.addObject("msg","ocok");
//	            mav.setViewName("member/loginMsg");
//	            if (dto.isAutologin() == true){
//	            	System.out.println(session.getId());
//	                Cookie cookie = new Cookie("loginCookie", session.getId());
//	                cookie.setPath("/");
//	                int amount = 60 * 60 * 24 * 7;
//	                cookie.setMaxAge(amount);
//	                response.addCookie(cookie);
//	                
//	                Date sessionLimit = new Date(System.currentTimeMillis() + (1000*amount));
//	                
//	                memberService.autoLogin(session.getId(), sessionLimit, vo.getU_id());
//	            }else if(dto.isAutologin() == false) {
//	            	System.out.println(session.getId());
//	            	Cookie cookie=new Cookie("loginCookie",session.getId());
//	            	cookie.setMaxAge(0);
//	            	response.addCookie(cookie);
//	            	
//	            }
//
//	        }else { 
//	        	mav.addObject("login","loginPage.do");
//	        	mav.addObject("msg","ncok");
//	            mav.setViewName("member/login");
//	        }
//	         
//	        return mav;
//	    }
	 
	 @RequestMapping(value="/logout.do")
	    public String logout(HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		 
		 Object obj = session.getAttribute("login");
	        if ( obj != null ){
	            MemberDTO vo = (MemberDTO)obj;
	            session.removeAttribute("login");
	            session.invalidate(); 
	            Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
	            if ( loginCookie != null ){
	                loginCookie.setPath("/");
	              
	                loginCookie.setMaxAge(0);
	                response.addCookie(loginCookie);
	           
	                Date date = new Date(System.currentTimeMillis());
	                memberService.autoLogin(session.getId(), date, vo.getU_id());
	            }
	        }
	        
	        return "index";
	    }

}
