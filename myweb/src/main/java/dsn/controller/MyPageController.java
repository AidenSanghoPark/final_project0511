package dsn.controller;

import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dsn.designer.model.DesignerService;
import dsn.member.model.MemberDTO;
import dsn.mypage.model.MyPageService;
import dsn.profile.model.ProfileDTO;
import dsn.virtualwallet.model.WalletDTO;
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
		
		ModelAndView mav=new ModelAndView();
		if(obj==null) {
			msg="로그인 후 이용해주세요";
			mav.addObject("msg", msg);
			mav.addObject("gopage","index.do");
			mav.setViewName("memberMsg");
		}else {
		int vo=mdto.getU_idx();
		System.out.println(vo);
		int totalCnt=myPageService.getTotalCnt(vo);
		int dtotalCnt=myPageService.getDesignerCnt(vo);
		int listSize=5;
		int pageSize=5;
		String dpageStr=dsn.page.PageModule.pageMake("myPage.do", dtotalCnt, listSize, pageSize, cp);
		String pageStr=dsn.page.PageModule.pageMake("myPage.do", totalCnt, listSize, pageSize, cp);
		List lists=myPageService.myPageList(cp, listSize, vo);
		List userinfo=myPageService.userInfoFind(vo);
		List dlists=myPageService.myPageListByDesigner(cp, listSize, vo);
		
		mav.addObject("dpageStr", dpageStr);
		mav.addObject("dlists", dlists);
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
		String pa1="^[가-힣a-zA-Z0-9]{2,10}$";
		String pa2="^01[0179][0-9]{7,8}$";
		String pa3="^[A-Za-z0-9_\\.\\-]+@[A-Za-z0-9\\-]+\\.[A-Za-z0-9\\-]+";
		ModelAndView mav=new ModelAndView();
		if(!Pattern.matches(pa1, dto.getU_nick())) {
			String msg="영어 대,소문자 숫자만 사용가능합니다.";
			mav.addObject("msg", msg);
			mav.addObject("gopage", "accountConfig.do");
			mav.setViewName("mypage/mypagemsg");
		}else if(!Pattern.matches(pa2, dto.getU_tel())) {
			String msg="전화번호는 숫자만 사용가능합니다 ex)01011112222";
			mav.addObject("msg", msg);
			mav.addObject("gopage", "accountConfig.do");
			mav.setViewName("mypage/mypagemsg");
		}else if(!Pattern.matches(pa3, dto.getU_email())){
			String msg="영어 대.소문자 숫자만 @ 만 사용가능합니다.";
			mav.addObject("msg", msg);
			mav.addObject("gopage", "accountConfig.do");
			mav.setViewName("mypage/mypagemsg");
		}else {
			String msg=result>0?"정보수정 완료":"정보수정 실패";
			mav.addObject("msg", msg);
			mav.addObject("gopage", "myPage.do");
			mav.setViewName("mypage/mypagemsg");
		}
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
		String pattern="^.*(?=^.{8,15}$)(?=.*\\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$";
		String u_pwd=mdto.getU_pwd();
		ModelAndView mav=new ModelAndView();
		String msg="";
		if(!Pattern.matches(pattern, pwdconfirm)) {
			msg="대소문자 및 특수문자가 포함된 8~15 길이 이상의 비밀번호를 입력해주세요.";
			mav.addObject("gopage", "passwordConfig.do");
		}else if(!checkpwd.equals(pwdconfirm)){
			msg="확인 비밀번호 불일치";
			mav.addObject("gopage", "passwordConfig.do");
		}else if(!lastpwd.equals(u_pwd)){
			msg="비밀번호 불일치";
			mav.addObject("gopage", "passwordConfig.do");
		}else if(checkpwd.equals(pwdconfirm)) {
			int result=myPageService.pwdUpdate(pwdconfirm,vo);
			msg=result>0?"비밀번호 변경 완료":"비밀번호 변경 실패";
			mav.addObject("gopage", "myPage.do");
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
		if(blc!=0){
			mav.addObject("blc", blc);
		}
		
		mav.setViewName("mypage/wallet");
		return mav;
	}
	@RequestMapping("payout.do")
	public ModelAndView payOut(HttpSession session) {
		ModelAndView mav=new ModelAndView();
		Object obj=session.getAttribute("login");
		MemberDTO mdto = (MemberDTO) obj;
		int vo=mdto.getU_idx();

		mav.addObject("u_idx", vo);
		mav.setViewName("mypage/payoutpopup");
		return mav;
	}
	@RequestMapping("payoutaction.do")
	public ModelAndView payOutConfirm(WithDrawDTO dto,HttpSession session) throws Exception{
		ModelAndView mav=new ModelAndView();
		Object obj=session.getAttribute("login");
		MemberDTO mdto = (MemberDTO) obj;
		try {
		String msg="";
		int price=Integer.parseInt(dto.getW_balance());
		int blc=myPageService.getLastBalance(mdto.getU_idx());
		if(price>blc) {
			msg="잔액이 부족합니다.";
			mav.addObject("msg", msg);
			mav.setViewName("mypage/popupclose");
			
		}else if(dto.getW_balance().equals(null)&&dto.getW_bank().equals(null)&&dto.getW_number().equals(null)){
			msg="출금정보를 정확히 기입해주세요.";
			mav.addObject("msg", msg);
			mav.setViewName("mypage/popupclose");
		}else {
		int result=myPageService.payout(dto);
		msg=result>0?"출금신청 완료":"출금신청 실패";
		
		mav.addObject("msg", msg);
		mav.setViewName("mypage/popupclose");
		}
		}catch(NumberFormatException e) {
			
		}
		return mav;
		
	}
	@RequestMapping("writeReview.do")
	public ModelAndView writeReview(String rv_content,HttpSession session) {
		Object obj=session.getAttribute("login");
		MemberDTO mdto=(MemberDTO) obj;
		int vo=mdto.getU_idx();
		ModelAndView mav=new ModelAndView();
		int result=myPageService.writeReview(vo,rv_content);
		String msg=result>0?"리뷰작성 완료":"리뷰작성 실패";
		mav.addObject("msg", msg);
		mav.addObject("gopage", "index.do");
		mav.setViewName("mypage/mypagemsg");
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
		mav.setViewName("mypage/paylists");
		return mav;
	}
}
