package dsn.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dsn.member.model.MemberDTO;
import dsn.mypage.model.MyPageDTO;
import dsn.mypage.model.MyPageService;


@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService myPageService;
	
	@RequestMapping("myPage.do")
	public ModelAndView myPage(@RequestParam(value = "cp",defaultValue = "1") int cp,HttpSession session){
		
		int vo=(int)session.getAttribute("u_idx");	
		ModelAndView mav=new ModelAndView();
		if(vo==0) {
			String msg="로그인 후 이용해주세요";
			mav.addObject("msg", msg);
			mav.addObject("gopage","index.do");
			return mav;
			
		}else {
		int totalCnt=myPageService.getTotalCnt();
		int listSize=5;
		int pageSize=5;
		String pageStr=dsn.page.PageModule.pageMake("myPage.do", totalCnt, listSize, pageSize, cp);
		List lists=myPageService.myPageList(cp, listSize, vo);
		List userinfo=myPageService.userInfoFind(vo);
		
		mav.addObject("lists", lists);
		mav.addObject("pageStr", pageStr);
		mav.addObject("u_idx", vo);
		mav.addObject("userinfo", userinfo);
		mav.setViewName("mypage/mypage");
		return mav;
		}
	}
	@RequestMapping("accountConfig.do")
	public ModelAndView accountConfig() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("mypage/accountConfig");
		return mav;
	}
	@RequestMapping("myPageUpdate.do")
	public ModelAndView userUpdate(MyPageDTO dto) {
		int result=myPageService.userUpdate(dto);
		String msg=result>0?"정보수정 완료":"정보수정 완료";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("gopage", "myPage.do");
		mav.setViewName("mypage/mypagemsg");
		return mav;
	}
	@RequestMapping("passwordConfig.do")
	public ModelAndView passwordConfig() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("mypage/passwordConfig");
		return mav;
	}
	@RequestMapping("pwdUpdate.do")
	public ModelAndView passwordUpdate(String checkpwd,String pwdconfirm) {
		ModelAndView mav=new ModelAndView();
		String msg="";
		if(checkpwd.equals(pwdconfirm)) {
			int result=myPageService.pwdUpdate(pwdconfirm);
			msg=result>0?"비밀번호 변경 완료":"비밀번호 변경 실패";
			mav.addObject("gopage", "myPage.do");
		}else {
			msg="비밀번호 불일치";
			mav.addObject("gopage", "passwordConfig.do");
		}
		mav.addObject("msg", msg);
		mav.setViewName("mypage/mypagemsg");
		return mav;
	}
	@RequestMapping("profileConfig.do")
	public ModelAndView profileConfig() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("mypage/profile");
		return mav;
	}
	@RequestMapping("wallet.do")
	public ModelAndView virtualWallet(@RequestParam(value = "cp",defaultValue = "1") int cp) {
		int totalCnt=myPageService.getTotalCnt();
		int blc=myPageService.getLastBalance();
		int listSize=5;
		int pageSize=5;
		String pageStr=dsn.page.PageModule.pageMake("wallet.do", totalCnt, listSize, pageSize, cp);
		List lists=myPageService.virtualWallet(cp, listSize);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("lists",lists);
		mav.addObject("pageStr", pageStr);
		mav.addObject("blc", blc);
		mav.setViewName("mypage/wallet");
		return mav;
	}
}