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
import dsn.module.*;
import dsn.page.PageModule;
import dsn.trade.model.TrdDTO;

@Controller
public class ContestController {
	
	@Autowired
	private ConService conService;
	
	
	@RequestMapping("/contestChoice.do")
	public ModelAndView contestHold() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("contest/contestChoice");
		return mav;
	}
	
	@RequestMapping(value = "/namingHold.do", method = RequestMethod.GET)
	public ModelAndView namingHoldView(@RequestParam(value="c_cate", defaultValue="")String c_cate) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("c_cate", c_cate);
		mav.setViewName("contest/namingHold");
		return mav;
	}
	
	@RequestMapping(value = "/arrcheck.do", method = RequestMethod.POST)
	@ResponseBody
	public void arrCheck(@RequestParam(value = "valueArr[]")
						List<String> valueArr) {
	   		System.out.println(valueArr);
	}

	@RequestMapping(value = "/namingHold_add.do", method = RequestMethod.POST)
	public ModelAndView namingHoldForm(MultipartHttpServletRequest request, ConDTO dto, HttpSession session) {	
		
		MemberDTO mdto = (MemberDTO) session.getAttribute("login");
		
		dto.setU_idx(mdto.getU_idx());
		ModelAndView mav=new ModelAndView();
		int result = conService.addNaming(dto);
		conService.updateTrd(dto);
		mav.addObject("result", result);
		//mav.addObject("upload", dto.getUpload());
		if(null != dto.getUpload()){
			String path = request.getSession().getServletContext().getRealPath("img/");
			copyInto(dto.getUpload(), path); 
		}
		mav.setViewName("contest/contestChoice"); //
		return mav;
	}
	//���̹� form
	@RequestMapping(value = "/namingHoldTrade_add.do", method = RequestMethod.POST)
	@ResponseBody
	public String namingHoldTradeForm(TrdDTO dto, HttpSession session) {
		
		MemberDTO mdto = (MemberDTO) session.getAttribute("login");
		
		dto.setU_idx(mdto.getU_idx());
		int result = conService.addNamingTrade(dto);
		return dto.getT_idx()+"";
	}
	//���Ϻ���
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
	//�ΰ� ����
	@RequestMapping(value = "/logoHold.do", method = RequestMethod.GET)
	public ModelAndView rogoHold(@RequestParam(value="c_cate", defaultValue="")String c_cate) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("c_cate", c_cate);
		System.out.println(c_cate);
		mav.setViewName("contest/logoHold");
		return mav;
	}
	//ĳ���� ����
	@RequestMapping(value = "/characterHold.do", method = RequestMethod.GET)
	public ModelAndView characterHold(@RequestParam(value="c_cate", defaultValue="")String c_cate) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("c_cate", c_cate);
		System.out.println(c_cate);
		mav.setViewName("contest/characterHold");
		return mav;
	}
	//��ǰ ����
	@RequestMapping(value = "/productHold.do", method = RequestMethod.GET)
	public ModelAndView productHold(@RequestParam(value="c_cate", defaultValue="")String c_cate) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("c_cate", c_cate);
		System.out.println(c_cate);
		mav.setViewName("contest/productHold");
		return mav;
	}
	//�μ� ����
	@RequestMapping(value = "/printHold.do", method = RequestMethod.GET)
	public ModelAndView printHold(@RequestParam(value="c_cate", defaultValue="")String c_cate) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("c_cate", c_cate);
		System.out.println(c_cate);
		mav.setViewName("contest/printHold");
		return mav;
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

			System.out.println(cp);
		    int totalCnt=conService.ContestCnt();
			int listSize=3;
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
	      System.out.println(keyword);
			PageModule PageModule = new PageModule();
			PageModule.setSearchType(searchType);
			PageModule.setKeyword(keyword);

		    int totalCnt=conService.ContestCnt();
			int listSize=3;
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
	@RequestMapping("/contestEndChoice.do")
	public ModelAndView contestChoice() {
		
		System.out.println("초이스작동");
		ModelAndView mav=new ModelAndView();
		conService.contestEnd(7);
		conService.designerWin(40);
		int pay=50000;
		conService.payUpdate(16,"제목",5000,16,5000);
		mav.addObject("gopage", "conList.do");
		mav.addObject("msg", "당선작 선정 완료");
		mav.setViewName("index");
		return mav;
	}
	@RequestMapping("/contestContent.do")
	public ModelAndView contestContent(
			@RequestParam int d_idx,
			@RequestParam int c_idx) {
		
		System.out.println("content d_idx="+d_idx);
		System.out.println("content c_idx="+c_idx);
		ModelAndView mav=new ModelAndView();
		DesignerConDTO dto=conService.contestContent(d_idx,c_idx);
		mav.addObject("ddto", dto);
		mav.setViewName("/contest/contestContent");
		return mav;
	}
	
}
