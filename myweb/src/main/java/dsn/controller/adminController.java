package dsn.controller;

import java.util.List;

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

import dsn.admin.model.adminService;
import dsn.askManage.model.AskManageDTO;
import dsn.askManage.model.AskManageService;
import dsn.contManage.model.ContManageDTO;
import dsn.contManage.model.ContManageService;
import dsn.designManage.model.DesignManageDTO;
import dsn.designManage.model.DesignManageService;
import dsn.memberManage.model.memberManageDTO;
import dsn.memberManage.model.memberManageService;
import dsn.noticeManage.model.NoticeManageDTO;
import dsn.noticeManage.model.NoticeManageService;
import dsn.reportManage.model.ReportManageDTO;
import dsn.reportManage.model.ReportManageService;
import dsn.withdraw.model.WithDrawDTO;
import dsn.withdrawManage.model.WithdrawManageService;

@Controller
public class adminController {

	public static final int NOT_ID = 1;
	public static int NOT_PWD = 2;
	public static int LOGIN_OK = 3;
	public static int ERROR = -1;

	@Autowired
	private adminService adminService;

	@Autowired
	private memberManageService memberManageService;

	@Autowired
	private AskManageService AskManageService;

	@Autowired
	private NoticeManageService NoticeManageService;

	@Autowired
	private ContManageService ContManageService;

	@Autowired
	private DesignManageService DesignManageService;

	@Autowired
	private ReportManageService ReportManageService;
	
	@Autowired
	private WithdrawManageService WithdrawManageService;

	@RequestMapping("memberManage.do")
	public ModelAndView memberList(@RequestParam(value = "cp", defaultValue = "1") int cp) {

		int totalCnt = memberManageService.getTotalCnt();
		int listSize = 10;
		int pageSize = 5;
		String pageStr = dsn.page.PageModule.pageMake("memberManage.do", totalCnt, listSize, pageSize, cp);

		List lists = memberManageService.memberList(cp, listSize);

		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		mav.addObject("pageStr", pageStr);

		mav.setViewName("admin/adminMemberList");

		return mav;
	}

	@RequestMapping("/memberContent.do")
	public ModelAndView memberContent(@RequestParam(value = "u_id", defaultValue = "0") String u_id) {

		memberManageDTO dto = memberManageService.memberContent(u_id);

		ModelAndView mav = new ModelAndView();
		/*
		 * if(dto == null) { mav.addObject("msg","잘못된 접근 또는 삭제된 게시글 입니다");
		 * mav.addObject("gopage","bbsList.do"); mav.setViewName("/bbs/bbsMsg"); }else {
		 */
		mav.addObject("dto", dto);
		mav.setViewName("admin/modal/memberContent");
		// }
		return mav;
	}
	
	@RequestMapping("memberBlockUpdate.do")
	public ModelAndView memberBlockUpdate(memberManageDTO dto) {

		int result = memberManageService.memberBlockUpdate(dto);

		ModelAndView mav = new ModelAndView();

		String msg = result > 0 ? "완료되었습니다." : "실패하였습니다.";

		mav.addObject("returnUrl", "memberManage.do");
		mav.addObject("msg", msg);
		mav.setViewName("admin/adminMsg");

		return mav;
	}

	@RequestMapping("/adminIndex.do")
	public ModelAndView adminIndex() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/modal/adminIndex");
		return mav;
	}

	@RequestMapping(value = "adminLogin.do", method = RequestMethod.POST)
	public ModelAndView adminLoginSubmit(@RequestParam("adminId") String adminId,
			@RequestParam("adminPwd") String adminPwd, HttpSession session,
			@RequestParam(value = "saveid", required = false) String saveid, HttpServletResponse resp)
			throws Exception {

		ModelAndView mav = new ModelAndView();
		
		String sid = (String) session.getAttribute("sid");

		if("".equals(sid) || sid == null) {
			int result = adminService.loginCheck(adminId, adminPwd);
			
			if (result == LOGIN_OK) {
				
				session.setAttribute("sid", adminId);
				
				if (saveid == null) {
					Cookie ck = new Cookie("saveId", adminId);
					ck.setMaxAge(0);
					resp.addCookie(ck);
				} else {
					Cookie ck = new Cookie("saveId", adminId);
					ck.setMaxAge(60 * 60 * 24 * 7);
					resp.addCookie(ck);
				}
				
				mav.addObject("saveId", adminId);
				// mav.setViewName("login/loginOk");
				mav.addObject("result", result);
			}
		}

		mav.setViewName("admin/adminMain");
		return mav;
	}
	
	@RequestMapping(value = "adminLogin.do", method = RequestMethod.GET)
	public ModelAndView adminIndex(HttpSession session,	HttpServletResponse resp)
			throws Exception {

		ModelAndView mav = new ModelAndView();
		
		String sid = (String) session.getAttribute("sid");

		if("".equals(sid) || sid == null) {
			mav.setViewName("admin/adminIndex");
		}else {
			mav.setViewName("admin/adminMain");
		}
		
		return mav;
	}

	@RequestMapping("adminlogout.do")
	public ModelAndView logout(HttpServletRequest req) {
		HttpSession session = req.getSession();

		session.invalidate();

		ModelAndView mav = new ModelAndView();
//		mav.addObject("msg","로그아웃되었습니다");
//		mav.addObject("goPage","index.do");
//		mav.setViewName("member/memberMsg");
		mav.setViewName("redirect:/adminIndex.do");

		return mav;
	}

	@RequestMapping("askManage.do")
	public ModelAndView askList(@RequestParam(value = "cp", defaultValue = "1") int cp) {

		int totalCnt = AskManageService.getTotalCnt();
		int listSize = 10;
		int pageSize = 5;
		String pageStr = dsn.page.PageModule.pageMake("askManage.do", totalCnt, listSize, pageSize, cp);

		List lists = AskManageService.askList(cp, listSize);

		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		mav.addObject("pageStr", pageStr);

		mav.setViewName("admin/adminAsk");

		return mav;
	}

	@RequestMapping("/askContent.do")
	public ModelAndView askContent(@RequestParam(value = "q_idx", defaultValue = "0") int q_idx) {

		AskManageDTO dto = AskManageService.askContent(q_idx);

		ModelAndView mav = new ModelAndView();
		/*
		 * if(dto == null) { mav.addObject("msg","잘못된 접근 또는 삭제된 게시글 입니다");
		 * mav.addObject("gopage","bbsList.do"); mav.setViewName("/bbs/bbsMsg"); }else {
		 */
		mav.addObject("dto", dto);
		mav.setViewName("admin/modal/askContent");
		// }
		return mav;
	}
	
	@RequestMapping("/reportContent.do")
	public ModelAndView reportContent(@RequestParam(value = "r_idx", defaultValue = "0") int r_idx) {
		
		ReportManageDTO dto = ReportManageService.reportContent(r_idx);
		
		ModelAndView mav = new ModelAndView();
		/*
		 * if(dto == null) { mav.addObject("msg","잘못된 접근 또는 삭제된 게시글 입니다");
		 * mav.addObject("gopage","bbsList.do"); mav.setViewName("/bbs/bbsMsg"); }else {
		 */
		mav.addObject("dto", dto);
		mav.setViewName("admin/modal/reportContent");
		// }
		return mav;
	}
	
	@RequestMapping("bbsManage.do")
	public ModelAndView noticeList(@RequestParam(value = "cp", defaultValue = "1") int cp) {

		int totalCnt = NoticeManageService.getTotalCnt();
		int listSize = 10;
		int pageSize = 5;
		String pageStr = dsn.page.PageModule.pageMake("bbsManage.do", totalCnt, listSize, pageSize, cp);

		List lists = NoticeManageService.noticeList(cp, listSize);

		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		mav.addObject("pageStr", pageStr);

		mav.setViewName("admin/adminNotice");

		return mav;
	}

	@RequestMapping("/noticeContent.do")
	public ModelAndView noticeContent(int n_idx) {

		NoticeManageDTO dto = NoticeManageService.noticeContent(n_idx);

		ModelAndView mav = new ModelAndView();
		/*
		 * if(dto == null) { mav.addObject("msg","잘못된 접근 또는 삭제된 게시글 입니다");
		 * mav.addObject("gopage","bbsList.do"); mav.setViewName("/bbs/bbsMsg"); }else {
		 */
		mav.addObject("dto", dto);
		mav.setViewName("admin/modal/noticeContent");
		// }
		return mav;
	}

	@RequestMapping("/noticeDelete.do")
	public ModelAndView noticeDel(int n_idx) {

		int result = NoticeManageService.noticeDel(n_idx);
		String msg = result > 0 ? "삭제완료" : "삭제실패";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("admin/adminMsg");

		return mav;
	}

	@RequestMapping("/noticeUpdateForm.do")
	public ModelAndView noticeUpdateForm(int n_idx) {

		NoticeManageDTO dto = NoticeManageService.noticeUpdateForm(n_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("admin/modal/adminNoticeUpdate");

		return mav;
	}

	@RequestMapping("/noticeUpdate.do")
	public ModelAndView noticeUpdate(NoticeManageDTO dto) {

		int result = NoticeManageService.noticeUpdate(dto);

		String msg = result > 0 ? "수정성공" : "수정실패";

		ModelAndView mav = new ModelAndView();

		mav.addObject("returnUrl", "bbsManage.do");
		mav.addObject("msg", msg);
		mav.setViewName("admin/adminMsg");

		return mav;
	}

	@RequestMapping("/noticeWriteForm.do")
	public ModelAndView noticeWriteForm() {

		ModelAndView mav = new ModelAndView();

		mav.setViewName("admin/modal/adminNoticeWrite");

		return mav;
	}

	@RequestMapping("/noticeWrite.do")
	public ModelAndView noticeWrite(NoticeManageDTO dto) {

		int result = NoticeManageService.noticeWrite(dto);

		String msg = result > 0 ? "글쓰기성공" : "글쓰기실패";

		ModelAndView mav = new ModelAndView();
		mav.addObject("returnUrl", "bbsManage.do");
		mav.addObject("msg", msg);
		mav.setViewName("admin/adminMsg");

		return mav;
	}

	@RequestMapping("contManage.do")
	public ModelAndView contList(@RequestParam(value = "cp", defaultValue = "1") int cp) {

		int totalCnt = ContManageService.getTotalCnt();
		int listSize = 10;
		int pageSize = 5;
		String pageStr = dsn.page.PageModule.pageMake("contManage.do", totalCnt, listSize, pageSize, cp);

		List lists = ContManageService.contList(cp, listSize);

		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		mav.addObject("pageStr", pageStr);

		mav.setViewName("admin/adminContest");

		return mav;
	}

//	@RequestMapping("contBlock.do")
//	public ModelAndView contBlock(ContManageDTO dto) {
//		
//		ContManageDTO cdto = ContManageService.contContent(dto.getC_idx());
//		
//		ModelAndView mav = new ModelAndView(); 
//		mav.addObject("dto",cdto);
//		
//		mav.setViewName("admin/adminContestBlock");
//		
//		return mav;
//	}

	@RequestMapping("contBlockUpdate.do")
	public ModelAndView contBlockUpdate(ContManageDTO dto) {

		int result = ContManageService.contBlockUpdate(dto);

		ModelAndView mav = new ModelAndView();

		String msg = result > 0 ? "완료되었습니다." : "실패하였습니다.";

		mav.addObject("returnUrl", "contManage.do");
		mav.addObject("msg", msg);
		mav.setViewName("admin/adminMsg");

		return mav;
	}

	@RequestMapping("designManage.do")
	public ModelAndView designList(@RequestParam(value = "cp", defaultValue = "1") int cp) {

		int totalCnt = DesignManageService.getTotalCnt();
		int listSize = 10;
		int pageSize = 5;
		String pageStr = dsn.page.PageModule.pageMake("designManage.do", totalCnt, listSize, pageSize, cp);

		List lists = DesignManageService.designList(cp, listSize);

		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		mav.addObject("pageStr", pageStr);

		mav.setViewName("admin/adminDesign");

		return mav;
	}

	@RequestMapping("designBlockUpdate.do")
	public ModelAndView designBlockUpdate(DesignManageDTO dto) {

		int result = DesignManageService.designBlockUpdate(dto);

		ModelAndView mav = new ModelAndView();

		String msg = result > 0 ? "완료되었습니다." : "실패하였습니다.";

		mav.addObject("returnUrl", "designManage.do");
		mav.addObject("msg", msg);
		mav.setViewName("admin/adminMsg");

		return mav;
	}

	@RequestMapping("reportManage.do")
	public ModelAndView reportList(@RequestParam(value = "cp", defaultValue = "1") int cp) {

		int totalCnt = ReportManageService.getTotalCnt();
		int listSize = 10;
		int pageSize = 5;
		String pageStr = dsn.page.PageModule.pageMake("reportManage.do", totalCnt, listSize, pageSize, cp);

		List lists = ReportManageService.reportList(cp, listSize);

		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		mav.addObject("pageStr", pageStr);

		mav.setViewName("admin/adminReport");

		return mav;
	}

	@RequestMapping("reportCheckUpdate.do")
	public ModelAndView reportCheckUpdate(ReportManageDTO dto) {

		int result = ReportManageService.reportCheckUpdate(dto);

		ModelAndView mav = new ModelAndView();

		String msg = result > 0 ? "완료되었습니다." : "실패하였습니다.";

		mav.addObject("returnUrl", "reportManage.do");
		mav.addObject("msg", msg);
		mav.setViewName("admin/adminMsg");

		return mav;
	}

	@RequestMapping("askCheckUpdate.do")
	public ModelAndView askCheckUpdate(AskManageDTO dto) {

		int result = AskManageService.askCheckUpdate(dto);

		ModelAndView mav = new ModelAndView();

		String msg = result > 0 ? "완료되었습니다." : "실패하였습니다.";

		mav.addObject("returnUrl", "askManage.do");
		mav.addObject("msg", msg);
		mav.setViewName("admin/adminMsg");

		return mav;
	}
	
	@RequestMapping("adminWithdraw.do")
	public ModelAndView withdraw(@RequestParam(value = "cp", defaultValue = "1") int cp) {
		int totalCnt = WithdrawManageService.getTotalCnt();
		int listSize = 10;
		int pageSize = 5;
		String pageStr = dsn.page.PageModule.pageMake("adminWithdraw.do", totalCnt, listSize, pageSize, cp);

		List lists = WithdrawManageService.withdrawList(cp, listSize);

		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		mav.addObject("pageStr", pageStr);

		mav.setViewName("admin/adminAccount");

		return mav;
	}
	
	@RequestMapping("adminWithdrawStatusUpdate.do")
	public ModelAndView withdrawStatusUpdate(WithDrawDTO dto) {

		int result = WithdrawManageService.withdrawStatusUpdate(dto);
		
		if(result > 0) {
			result = WithdrawManageService.accountInsert(dto);
		}

		ModelAndView mav = new ModelAndView();

		String msg = result > 0 ? "완료되었습니다." : "실패하였습니다.";

		mav.addObject("returnUrl", "adminWithdraw.do");
		mav.addObject("msg", msg);
		mav.setViewName("admin/adminMsg");

		return mav;
	}
}
