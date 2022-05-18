package dsn.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dsn.member.model.MemberDTO;
import dsn.mypage.model.MyPageService;
import dsn.review.model.ReviewDTO;
import dsn.withdraw.model.WithDrawDTO;


@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService myPageService;
	
	@RequestMapping("myPage.do")
	public ModelAndView myPage(@RequestParam(value = "cp",defaultValue = "1") int cp,HttpSession session){
		
		String msg="";
		Object obj=session.getAttribute("login");
		MemberDTO mdto = (MemberDTO) obj;
		int vo=mdto.getU_idx();
		ModelAndView mav=new ModelAndView();
		if(obj==null) {
			msg="로그인 후 이용해주세요";
			mav.addObject("msg", msg);
			mav.addObject("gopage","index.do");
		}else {
		int totalCnt=myPageService.getTotalCnt(vo);
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
		}
		return mav;
	}
	@RequestMapping("accountConfig.do")
	public ModelAndView accountConfig(HttpSession session) {
		Object obj=session.getAttribute("login");
		MemberDTO mdto = (MemberDTO) obj;
		int vo=mdto.getU_idx();
		List userinfo=myPageService.userInfoFind(vo);
		ModelAndView mav=new ModelAndView();
		mav.addObject("userinfo", userinfo);
		mav.setViewName("mypage/accountConfig");
		return mav;
	}
	@RequestMapping("myPageUpdate.do")
	public ModelAndView userUpdate(MemberDTO dto) {
		
		int result=myPageService.userUpdate(dto);
		String msg=result>0?"정보수정 완료":"정보수정 실패";
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
	public ModelAndView passwordUpdate(String checkpwd,String pwdconfirm,String lastpwd,HttpSession session) {
		Object obj=session.getAttribute("login");
		MemberDTO mdto = (MemberDTO) obj;
		int vo=mdto.getU_idx();
		String u_pwd=mdto.getU_pwd();
		ModelAndView mav=new ModelAndView();
		String msg="";
		if(checkpwd.equals(pwdconfirm)) {
			int result=myPageService.pwdUpdate(pwdconfirm,vo);
			msg=result>0?"비밀번호 변경 완료":"비밀번호 변경 실패";
			mav.addObject("gopage", "myPage.do");
			if(!lastpwd.equals(u_pwd)) {
				msg="비밀번호 불일치";
				mav.addObject("gopage", "passwordConfig.do");
			}
		}else if(!checkpwd.equals(pwdconfirm)){
			msg="확인 비밀번호 불일치";
			mav.addObject("gopage", "passwordConfig.do");
		}else {
			msg="관리자 문의";
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
	public ModelAndView virtualWallet(@RequestParam(value = "cp",defaultValue = "1") int cp,HttpSession session) {
		Object obj=session.getAttribute("login");
		MemberDTO mdto = (MemberDTO) obj;
		int vo=mdto.getU_idx();
		
		int totalCnt=myPageService.getWalletCnt(vo);
		int blc=myPageService.getLastBalance(vo);
		int listSize=5;
		int pageSize=5;
		String pageStr=dsn.page.PageModule.pageMake("wallet.do", totalCnt, listSize, pageSize, cp);
		List lists=myPageService.virtualWallet(cp, listSize, vo);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("lists",lists);
		mav.addObject("pageStr", pageStr);
		mav.addObject("blc", blc);
		mav.setViewName("mypage/wallet");
		return mav;
	}
	@RequestMapping("payout.do")
	public ModelAndView payOut(HttpSession session) {
		Object obj=session.getAttribute("login");
		MemberDTO mdto = (MemberDTO) obj;
		int vo=mdto.getU_idx();
		ModelAndView mav=new ModelAndView();
		mav.addObject("u_idx", vo);
		mav.setViewName("mypage/payoutpopup");
		return mav;
	}
	@RequestMapping("payoutaction.do")
	public ModelAndView payOutConfirm(WithDrawDTO dto) throws Exception{
		ModelAndView mav=new ModelAndView();
		String msg="";
		int price=Integer.parseInt(dto.getW_price());
		int blc=myPageService.getLastBalance(dto.getU_idx());
		
		if(price>blc) {
			msg="잔액이 부족합니다";
			mav.addObject("msg", msg);
			mav.setViewName("mypage/popupclose");
			
		}else {
		int result=myPageService.payout(dto);
		msg=result>0?"출금신청 완료":"출금신청 실패";
		mav.addObject("msg", msg);
		mav.setViewName("mypage/popupclose");
		}
		return mav;
		
	}
	@RequestMapping("writeReview.do")
	public ModelAndView writeReview(ReviewDTO dto) {
		ModelAndView mav=new ModelAndView();
		int result=myPageService.writeReview(dto);
		String msg=result>0?"리뷰작성 완료":"리뷰작성 실패";
		mav.addObject("msg", msg);
		mav.setViewName("mypage/popupclose");
		return mav;
	}
	@RequestMapping("showPayInfo.do")
	public ModelAndView payInfo(@RequestParam(value = "cp",defaultValue = "1") int cp,HttpSession session) {
		
		Object obj=session.getAttribute("login");
		MemberDTO mdto = (MemberDTO) obj;
		int vo=mdto.getU_idx();
		int totalCnt=myPageService.getTradeCnt(vo);
		int listSize=10;
		int pageSize=5;
		List lists=myPageService.showPayInfo(cp, listSize, vo);
		String pageStr=dsn.page.PageModule.pageMake("showPayInfo.do", totalCnt, listSize, pageSize, cp);

		ModelAndView mav=new ModelAndView();
		mav.addObject("pageStr", pageStr);
		mav.addObject("lists", lists);
		mav.setViewName("mypage/showpay");
		return mav;
	}
}