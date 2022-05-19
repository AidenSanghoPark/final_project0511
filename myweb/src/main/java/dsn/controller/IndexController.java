package dsn.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dsn.askManage.model.AskManageDTO;
import dsn.askManage.model.AskManageService;
import dsn.member.model.MemberDTO;
import dsn.noticeManage.model.NoticeManageDTO;
import dsn.noticeManage.model.NoticeManageService;

@Controller
public class IndexController {
	
	@Autowired
	private NoticeManageService NoticeManageService;
	
	@Autowired
	private AskManageService AskManageService;

	@RequestMapping("/index.do")
	public ModelAndView index() {
		
		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("/index");
		return mav;
	}
	
	@RequestMapping("notice.do")
	public ModelAndView noticeList2(@RequestParam(value = "cp", defaultValue = "1") int cp) {

		int totalCnt = NoticeManageService.getTotalCnt();
		int listSize = 10;
		int pageSize = 5;
		String pageStr = dsn.page.PageModule.pageMake("notice.do", totalCnt, listSize, pageSize, cp);

		List lists = NoticeManageService.noticeList(cp, listSize);

		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		mav.addObject("pageStr", pageStr);

		mav.setViewName("/notice");

		return mav;
	}
	
	@RequestMapping("noticeCont.do")
	public ModelAndView noticeContent(int n_idx) {

		NoticeManageDTO dto = NoticeManageService.noticeContent(n_idx);

		ModelAndView mav = new ModelAndView();
		/*
		 * if(dto == null) { mav.addObject("msg","잘못된 접근 또는 삭제된 게시글 입니다");
		 * mav.addObject("gopage","bbsList.do"); mav.setViewName("/bbs/bbsMsg"); }else {
		 */
		mav.addObject("dto", dto);
		mav.setViewName("noticeContent");
		// }
		return mav;
	}
	
	@RequestMapping("askCont.do")
	public ModelAndView askContent(int q_idx) {

		AskManageDTO dto = AskManageService.askContent(q_idx);

		ModelAndView mav = new ModelAndView();
		/*
		 * if(dto == null) { mav.addObject("msg","잘못된 접근 또는 삭제된 게시글 입니다");
		 * mav.addObject("gopage","bbsList.do"); mav.setViewName("/bbs/bbsMsg"); }else {
		 */
		mav.addObject("dto", dto);
		mav.setViewName("askContent");
		// }
		return mav;
	}
	//문의작성 폼 
	@RequestMapping("/askWriteForm.do")
	public ModelAndView askWriteForm() {

		ModelAndView mav = new ModelAndView();

		mav.setViewName("admin/modal/adminAskWrite");

		return mav;
	}
	
	//작성 등록
	@RequestMapping("/askWrite.do")
	public ModelAndView askWrite(AskManageDTO dto, HttpSession session) {
		
		MemberDTO mdto = (MemberDTO) session.getAttribute("login");
		
		dto.setU_idx(mdto.getU_idx());

		int result = AskManageService.askWrite(dto);

		String msg = result > 0 ? "글쓰기성공" : "글쓰기실패";

		ModelAndView mav = new ModelAndView();
		mav.addObject("returnUrl", "ask.do");
		mav.addObject("msg", msg);
		mav.setViewName("redirect:/ask.do");

		return mav;
	}
	
	//문의 삭제
	@RequestMapping("/askDelete.do")
	public ModelAndView askDel(int q_idx) {

		int result = AskManageService.askDel(q_idx);
		String msg = result > 0 ? "삭제완료" : "삭제실패";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("admin/adminMsg");

		return mav;
	}
	
	//수정 폼
	@RequestMapping("/askUpdateForm.do")
	public ModelAndView askUpdateForm(int q_idx) {

		AskManageDTO dto = AskManageService.askUpdateForm(q_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("admin/modal/adminAskUpdate");

		return mav;
	}
	
	// 문의 수정 저장
	@RequestMapping("/askUpdate.do")
	public ModelAndView askUpdate(AskManageDTO dto) {
		int result = AskManageService.askUpdate(dto);

		String msg = result > 0 ? "수정성공" : "수정실패";

		ModelAndView mav = new ModelAndView();

		mav.addObject("returnUrl", "ask.do");
		mav.addObject("msg", msg);
		mav.setViewName("admin/adminMsg");

		return mav;
	}
	
	@RequestMapping("ask.do")
	public ModelAndView askUserList(@RequestParam(value = "cp", defaultValue = "1") int cp, HttpSession session) {
		MemberDTO mdto = (MemberDTO) session.getAttribute("login");
		
		int totalCnt = AskManageService.getUserTotalCnt(mdto.getU_idx());
		int listSize = 10;
		int pageSize = 5;
		String pageStr = dsn.page.PageModule.pageMake("ask.do", totalCnt, listSize, pageSize, cp);

		List lists = AskManageService.askUserList(cp, listSize, mdto.getU_idx());

		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		mav.addObject("pageStr", pageStr);

		mav.setViewName("/ask");

		return mav;
	}
	
}
