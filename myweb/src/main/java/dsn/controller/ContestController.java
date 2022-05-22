package dsn.controller;

import java.io.File;


import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import dsn.member.model.MemberDTO;
import dsn.member.model.MemberService;

import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import dsn.contest.model.*;
import dsn.designer.model.DesignerDTO;
import dsn.module.*;
import dsn.noticeManage.model.NoticeManageDTO;
import dsn.page.PageModule;
import dsn.profile.model.ProfileDTO;
import dsn.trade.model.TrdDTO;

@Controller
public class ContestController {
	
	@Autowired
	private ConService conService;
	
	//콘테스트 초이스
	@RequestMapping("/categoryChoice.do")
	public ModelAndView contestHold(HttpServletRequest request) {
//		String url=request.getHeader("REFERER");
//    	request.getSession().setAttribute("logUrl", url);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("contest/categoryChoice");
		return mav;
	}
	//로고 뷰
	@RequestMapping(value = "/logoHold.do", method = RequestMethod.GET)
	public ModelAndView logoHolddView(@RequestParam(value="c_cate", defaultValue="")String c_cate) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("c_cate", c_cate);
		mav.setViewName("contest/logoHold");
		return mav;
	}
	//로고 form
	@RequestMapping(value = "/logoHold_add.do", method = RequestMethod.POST)
	public ModelAndView logoHoldForm(MultipartHttpServletRequest request, ConDTO dto, HttpSession session) {	
		
		
		MemberDTO mdto = (MemberDTO) session.getAttribute("login");
		
		dto.setU_idx(mdto.getU_idx());
		ModelAndView mav = new ModelAndView();
		int result = conService.addLogo(dto);
		conService.updateTrd(dto);
		mav.addObject("result", result);
		//mav.addObject("upload", dto.getUpload());
		if(null != dto.getUpload()){
			String path = request.getSession().getServletContext().getRealPath("img/");
			copyInto(dto.getUpload(), path); 
		}
		mav.setViewName("contest/index");
		return mav;
	}
	//로고 트레이드 form
	@RequestMapping(value = "/logoHoldTrade_add.do", method = RequestMethod.POST)
	@ResponseBody
	public String logoHoldTradeForm(TrdDTO dto, HttpSession session) {
		
		MemberDTO mdto = (MemberDTO) session.getAttribute("login");
		
		dto.setU_idx(mdto.getU_idx());
		int result = conService.addLogoTrade(dto);
		return dto.getT_idx()+"";
	}
	//네이밍 뷰
	@RequestMapping(value = "/namingHold.do", method = RequestMethod.GET)
	public ModelAndView namingHold(@RequestParam(value="c_cate", defaultValue="")String c_cate) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("c_cate", c_cate);
		mav.setViewName("contest/namingHold");
		return mav;
	}
	//네이밍 폼
	@RequestMapping(value = "/namingHold_add.do", method = RequestMethod.POST)
	public ModelAndView namingHoldForm(MultipartHttpServletRequest request, ConDTO dto, HttpSession session) {	
		
		MemberDTO mdto = (MemberDTO) session.getAttribute("login");
		
		dto.setU_idx(mdto.getU_idx());
		ModelAndView mav = new ModelAndView();
		int result = conService.addNaming(dto);
		conService.updateTrd(dto);
		mav.addObject("result", result);
		//mav.addObject("upload", dto.getUpload());
		if(null != dto.getUpload()){
			String path = request.getSession().getServletContext().getRealPath("img/");
			copyInto(dto.getUpload(), path); 
		}
		mav.setViewName("contest/namingHold");
		return mav;
	}
	//네이밍 트레이드
	@RequestMapping(value = "/namingHoldTrade_add.do", method = RequestMethod.POST)
	@ResponseBody
	public String namingHoldTradeForm(TrdDTO dto, HttpSession session) {
			
		MemberDTO mdto = (MemberDTO) session.getAttribute("login");
			
		dto.setU_idx(mdto.getU_idx());
		int result = conService.addLogoTrade(dto);
		return dto.getT_idx()+"";
	}
	
	//캐릭터 뷰
	@RequestMapping(value = "/characterHold.do", method = RequestMethod.GET)
	public ModelAndView characterHold(@RequestParam(value="c_cate", defaultValue="")String c_cate) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("c_cate", c_cate);
		mav.setViewName("contest/characterHold");
		return mav;
	}
	//캐릭터 폼
	@RequestMapping(value = "/charHold_add.do", method = RequestMethod.POST)
	public ModelAndView	charHoldForm(MultipartHttpServletRequest request, ConDTO dto, HttpSession session) {	
			
		MemberDTO mdto = (MemberDTO) session.getAttribute("login");
			
		dto.setU_idx(mdto.getU_idx());
		ModelAndView mav = new ModelAndView();
		int result = conService.addChar(dto);
		conService.updateTrd(dto);
		mav.addObject("result", result);
		//mav.addObject("upload", dto.getUpload());
		if(null != dto.getUpload()){
			String path = request.getSession().getServletContext().getRealPath("img/");
			copyInto(dto.getUpload(), path); 
		}
		mav.setViewName("contest/characterHold");
		return mav;
	}
	//캐릭터 트레이드
	@RequestMapping(value = "/charHoldTrade_add.do", method = RequestMethod.POST)
	@ResponseBody
	public String charHoldTradeForm(TrdDTO dto, HttpSession session) {
				
		MemberDTO mdto = (MemberDTO) session.getAttribute("login");
				
		dto.setU_idx(mdto.getU_idx());
		int result = conService.addCharTrade(dto);
		return dto.getT_idx()+"";
	}
	//인쇄 뷰
	@RequestMapping(value = "/printHold.do", method = RequestMethod.GET)
	public ModelAndView printHold(@RequestParam(value="c_cate", defaultValue="")String c_cate) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("c_cate", c_cate);
		mav.setViewName("contest/printHold");
		return mav;
	}
	//인쇄 폼
	@RequestMapping(value = "/printHold_add.do", method = RequestMethod.POST)
	public ModelAndView	printHoldForm(MultipartHttpServletRequest request, ConDTO dto, HttpSession session) {	
				
		MemberDTO mdto = (MemberDTO) session.getAttribute("login");
				
		dto.setU_idx(mdto.getU_idx());
		ModelAndView mav = new ModelAndView();
		int result = conService.addPrint(dto);
		conService.updateTrd(dto);
		mav.addObject("result", result);
		//mav.addObject("upload", dto.getUpload());
		if(null != dto.getUpload()){
			String path = request.getSession().getServletContext().getRealPath("img/");
			copyInto(dto.getUpload(), path); 
		}
		mav.setViewName("contest/printHold");
		return mav;
	}
	//인쇄 트레이드
	@RequestMapping(value = "/printHoldTrade_add.do", method = RequestMethod.POST)
	@ResponseBody
	public String printHoldTradeForm(TrdDTO dto, HttpSession session) {
					
		MemberDTO mdto = (MemberDTO) session.getAttribute("login");
					
		dto.setU_idx(mdto.getU_idx());
		int result = conService.addPrintTrade(dto);
		return dto.getT_idx()+"";
	}
	
	@RequestMapping(value = "contestJoin.do", method = RequestMethod.GET)
	public ModelAndView contestJoin(ConDTO dto, HttpServletRequest request, HttpSession session) {
		
		Object obj=session.getAttribute("login");
		MemberDTO mdto = (MemberDTO) obj;
		
//		String url=request.getHeader("REFERER");
//    	request.getSession().setAttribute("conUrl", url);
		ModelAndView mav=new ModelAndView();
		ConDTO con=conService.conInfo(dto.getC_idx());
		mav.addObject("mdto",mdto);
		mav.addObject("condto", con);
		mav.setViewName("contest/contestJoin");
		return mav;
	}
	@RequestMapping(value = "contestJoinSubmit.do", method = RequestMethod.POST)
	public ModelAndView contestJoinForm(MultipartHttpServletRequest request ,DesignerConDTO dto) {
		
		ModelAndView mav=new ModelAndView();
		FileUploadModule file=new FileUploadModule();
		String path=request.getSession().getServletContext().getRealPath("img/");
		file.copyInto(path,dto.getUploadfile1());
		file.copyInto(path,dto.getUploadfile2());
		int result=conService.contestJoin(dto);
		String msg=result>0?"콘테스트 참여 완료":"콘테스트 참여 실패";
		mav.addObject("msg",msg);
		mav.addObject("gopage", "index.do");
		mav.setViewName("/contest/contestMsg");
		return mav;
	}
	
	@RequestMapping(value = "/conList.do")
	   public ModelAndView conList(
			   @RequestParam(value="cp",defaultValue = "1") int cp,
			   @RequestParam(required = false, defaultValue = "전체") String c_cate,
			   @RequestParam(required = false, defaultValue = "") String searchType,
			   @RequestParam(required = false, defaultValue = "") String keyword) throws Exception {
			PageModule PageModule = new PageModule();
			PageModule.setSearchType(searchType);
			PageModule.setKeyword(keyword);

		    int totalCnt=conService.ContestCnt();
			int listSize=4;
			int pageSize=3;
			
			List lists = null;
			String p_command = "";
			if(c_cate.equals("전체")) {
				lists=conService.conList(cp,listSize,searchType,keyword);
			}else {
				lists = conService.cateList(cp, listSize, c_cate);
			}
			
			String pageStr="";
			if(searchType=="") {
				pageStr=dsn.page.PageModule.pageMake(p_command, totalCnt, listSize, pageSize, cp);
			}else {
				pageStr=dsn.page.PageModule.searchPageMake(p_command,
					totalCnt, listSize, pageSize, cp, searchType, keyword);
			}
			
			int dateUp=conService.dateUp();
			
	      //페이징 처리 끝
	      
	      ModelAndView mav=new ModelAndView();
	      mav.addObject("dateUp",dateUp);
	      mav.addObject("c_cate",c_cate);
		  mav.addObject("pageStr",pageStr);
		  mav.addObject("lists",lists);
		  mav.setViewName("contest/conList");
	      
	      return mav; 
	   } 

	
	@RequestMapping(value = "/conEnd.do")
	   public ModelAndView conEnd(
			   @RequestParam(value="cp",defaultValue = "1") int cp,
			   @RequestParam(required = false, defaultValue = "전체") String c_cate,
			   @RequestParam(required = false, defaultValue = "") String searchType,
			   @RequestParam(required = false, defaultValue = "") String keyword) throws Exception {
			PageModule PageModule = new PageModule();
			PageModule.setSearchType(searchType);
			PageModule.setKeyword(keyword);

		    int totalCnt=conService.ContestCnt();
			int listSize=4;
			int pageSize=3;
			
			List lists = null;
			String p_command = "";
			if(c_cate.equals("전체")) {
				lists=conService.conEnd(cp,listSize,searchType,keyword);
			}else {
				lists = conService.cateEnd(cp, listSize, c_cate);
			}
			
			String pageStr="";
			if(searchType=="") {
				pageStr=dsn.page.PageModule.pageMake(p_command, totalCnt, listSize, pageSize, cp);
			}else {
				pageStr=dsn.page.PageModule.searchPageMake(p_command,
					totalCnt, listSize, pageSize, cp, searchType, keyword);
			}
			
			int dateUp=conService.dateUp();
			
	      //페이징 처리 끝
	      
	      ModelAndView mav=new ModelAndView();
	      mav.addObject("dateUp",dateUp);
	      mav.addObject("c_cate",c_cate);
		  mav.addObject("pageStr",pageStr);
		  mav.addObject("lists",lists);
		  mav.setViewName("contest/conEnd");
	      
	      return mav; 
	   } 
	
	@RequestMapping(value = "/conContent.do")
	public ModelAndView conContent(
			@RequestParam(value="c_idx", defaultValue = "0") int c_idx){
		ConDTO dto=conService.conContent(c_idx);
		ModelAndView mav=new ModelAndView();
		if(dto==null) {
			mav.addObject("msg", "잘못된 접근 또는 삭제된 콘테스트입니다.");
			mav.addObject("gopage","conList.do");
			mav.setViewName("contest/conMsg");
		}else {
			mav.addObject("dto",dto);
			mav.setViewName("contest/conContent");
		}
		return mav;
	}

	@RequestMapping("/fileDown.do")
	public ModelAndView fileDown(@RequestParam("filename")String filename) {
		File f=new File("C:/Users/user/Desktop/이젠/jspstudy4/myweb/src/main/webapp/upload/"+filename);
		ModelAndView mav=new ModelAndView();
		mav.addObject("downloadFile",f);
		mav.setViewName("dsnDown");
		return mav;
	}
	
	@RequestMapping(value = "contestEndChoice.do", method = RequestMethod.POST)
	 public @ResponseBody ModelAndView contestEndChoice(
			@RequestParam int c_idx,
			@RequestParam int d_idx) {
		System.out.println(c_idx);
		int getuser=conService.designerUser(d_idx);
		System.out.println("desgineruser="+getuser);
		int conpay=conService.contestPay(c_idx);
		System.out.println(conpay);
		ModelAndView mav=new ModelAndView();
		conService.contestEnd(c_idx);
		conService.designerWin(d_idx);
		conService.payUpdate(getuser,conpay,getuser,conpay);
		mav.addObject("gopage", "conList.do");
		mav.addObject("msg", "당선작 선정 완료");
		mav.setViewName("index");
		return mav;
	}
	@RequestMapping("/contestContent.do")
	public ModelAndView contestContent(
			@RequestParam int d_idx,
			@RequestParam int c_idx) {
		ModelAndView mav=new ModelAndView();
		DesignerConDTO dto=conService.contestContent(d_idx,c_idx);
		mav.addObject("ddto", dto);
		mav.setViewName("/contest/contestContent");
		return mav;
	}
	
	@RequestMapping("conPart.do")
	public ModelAndView conPart(@RequestParam(value = "cp", defaultValue = "1") int cp,
			@RequestParam(value="c_idx", defaultValue="0") int c_idx) {
		ConDTO dto=conService.conContent(c_idx);
		int totalCnt=conService.ContestCnt();
		int listSize=5;
		int pageSize=5;
		String pageStr=dsn.page.PageModule.pageMake("conPart.do", totalCnt, listSize, pageSize, cp);
		List dlists=conService.conPart(cp, listSize, c_idx);
		ModelAndView mav=new ModelAndView();
		mav.addObject("dlists", dlists);
		mav.addObject("pageStr", pageStr);
		mav.addObject("dto",dto);
		mav.addObject("c_idx", c_idx);
		
		mav.setViewName("contest/conPart");
		return mav;
		
	}
	
	@RequestMapping("conPartContent.do")
	public ModelAndView conPartContent(
			@RequestParam(value="d_idx", defaultValue="0") int d_idx,
			@RequestParam(value="c_idx", defaultValue="0") int c_idx) {
		ConDTO cdto=conService.conContent2(c_idx);
		DesignerDTO ddto=conService.conPartContent(d_idx);
		ModelAndView mav=new ModelAndView();
		mav.addObject("ddto",ddto);
		mav.addObject("cdto", cdto);
		
		mav.setViewName("contest/conPartContent");
		return mav;
		
	}
	
	//체크 박스
	@RequestMapping(value = "/arrcheck.do", method = RequestMethod.POST)
	@ResponseBody
	public void arrCheck(@RequestParam(value = "valueArr[]")List<String> valueArr) {
		
	}
	//파일 복사
	public void copyInto(MultipartFile upload, String path) {
		
		try {
			byte bytes[] = upload.getBytes();
			File f = new File(path + upload.getOriginalFilename());
			FileOutputStream fos = new FileOutputStream(f);
			fos.write(bytes);
			fos.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}
	
	@RequestMapping("/conContentModal.do")
	public ModelAndView conContentModal() {
		

		ModelAndView mav = new ModelAndView();
		mav.setViewName("contest/conModal/conContentModal");
		return mav;
	}
}
