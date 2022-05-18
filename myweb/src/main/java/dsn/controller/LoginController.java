package dsn.controller;

import java.util.Date;
import java.util.Map;

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
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springframework.web.util.WebUtils;

import dsn.member.model.LoginDTO;
import dsn.member.model.MemberDTO;
import dsn.member.model.MemberService;

@Controller
public class LoginController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/login.do",method= RequestMethod.GET)
	public String loginView(@ModelAttribute("loginVO")LoginDTO loginVO,HttpServletRequest request,Model model) throws Exception{
		
		String url=request.getHeader("REFERER");
    	request.getSession().setAttribute("logUrl", url);
		Map<String, ?> inputFlashMap = RequestContextUtils.getInputFlashMap(request);
		if(null != inputFlashMap) {
			model.addAttribute("msg",(String) inputFlashMap.get("msg"));
		}
		return "/login";
	}
	
	@RequestMapping(value="/loginPost.do" , method= RequestMethod.POST)
	public void loginPost(LoginDTO ldto, Model model, HttpSession session)throws Exception{
		
		MemberDTO memberVO = memberService.login(ldto);
		if( memberVO == null || ldto.getU_pwd()==memberVO.getU_pwd()) {
			return;
		}
		
		
		model.addAttribute("user", memberVO);
		if(ldto.isUseCookie()) {
			int amount = 60*60*24*7;
			Date sessionLimit = new Date(System.currentTimeMillis() + (1000*amount));
			memberService.autoLogin(session.getId(),memberVO.getU_id(), sessionLimit);
		
		}
		
	}
	
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
                memberService.autoLogin(vo.getU_id(),session.getId(), date);
            }
        }
        return "/index"; 
    }
}
