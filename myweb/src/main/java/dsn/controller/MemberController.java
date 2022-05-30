package dsn.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dsn.member.model.*;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	//member choice
	@RequestMapping("/joinChoice.do")
	public ModelAndView memberChoice() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("member/joinChoice");
		
		return mav;
	}
	//memberjoin
	@RequestMapping(value = "/memberJoin.do", method = RequestMethod.GET)
	public ModelAndView memberJoinForm(@RequestParam(value="u_type", defaultValue="0")int u_type) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("u_type", u_type);
		System.out.println(u_type);
		mav.setViewName("member/memberJoin");
		return mav;
		
	}
	//memberjoin
	@RequestMapping(value = "/memberJoin.do", method = RequestMethod.POST)
	public ModelAndView memberJoinSubmit(MemberDTO dto) {
		
		int result = memberService.memberJoin(dto);
		String msg = result > 0? "환영합니다!":"가입에 실패하셨어요!";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("goPage", "index.do");
		mav.setViewName("member/memberMsg");
		return mav;
	}
	//id check
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.GET)
	@ResponseBody	
	public String idCheck(@RequestParam("u_id") String userid) {

		int result = memberService.idCheck(userid);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
		return result+"";
		
	}
	//nick check
	@RequestMapping(value = "/nickCheck.do", method = RequestMethod.GET)
	@ResponseBody	
	public String nickCheck(@RequestParam("u_nick") String usernick) {

		int result2 = memberService.nickCheck(usernick);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result2", result2);
		return result2 + "";
		
	}
	//email check
	@RequestMapping(value = "/emailCheck.do", method = RequestMethod.GET)
	@ResponseBody	
	public String emailCheck(@RequestParam("u_email") String useremail) {

		int result3 = memberService.emailCheck(useremail);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result3", result3);
		return result3 + "";
		
	}
}
