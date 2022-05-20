package dsn.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import dsn.designer.model.DesignerDTO;
import dsn.designer.model.DesignerService;
import dsn.member.model.MemberDTO;
import dsn.profile.model.ProfileDTO;

import java.io.*;

@Controller
public class DesignerController {
	
	@Autowired
	private DesignerService designerService;
	
	@Autowired ServletContext servletContext;
	
	@RequestMapping("portfolio.do")
	public ModelAndView portfolio(@RequestParam(value = "cp", defaultValue = "1") int cp, HttpSession session) {
		
		Object obj=session.getAttribute("login");
		MemberDTO mdto = (MemberDTO) obj;
		int u_idx=mdto.getU_idx();
		
		int totalCnt=designerService.getDesignerCnt(u_idx);
		int listSize=5;
		int pageSize=3;
		String pageStr=dsn.page.PageModule.pageMake("portfolio.do", totalCnt, listSize, pageSize, cp);
		
		List lists=designerService.portfolio(cp, listSize, u_idx);
		System.out.println(lists);
		
		ProfileDTO pdto=designerService.profileInfo(u_idx);
		MemberDTO udto=designerService.userInfo(u_idx);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("lists", lists);
		mav.addObject("pageStr", pageStr);
		
		mav.addObject("pdto", pdto);
		mav.addObject("udto", udto);
		mav.addObject("u_idx", u_idx);
		
		mav.setViewName("designer/portfolio");
		return mav;
	}
	
	@RequestMapping("portfolio2.do")
	public ModelAndView portfolio2(@RequestParam(value = "cp", defaultValue = "1") int cp, @RequestParam(value="u_idx") int u_idx) {
		
		int totalCnt=designerService.portfolioTotalCnt();
		int listSize=5;
		int pageSize=5;
		String pageStr=dsn.page.PageModule.pageMake("portfolio.do", totalCnt, listSize, pageSize, cp);
		
		List lists=designerService.portfolio(cp, listSize, u_idx);
		
		int win=designerService.designerWin(u_idx);
		ProfileDTO pdto=designerService.profileInfo(u_idx);
		MemberDTO udto=designerService.userInfo(u_idx);
		System.out.println(udto.getU_nick());
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("lists", lists);
		mav.addObject("pageStr", pageStr);
		
		mav.addObject("pdto", pdto);
		mav.addObject("udto", udto);
		mav.addObject("u_idx", u_idx);
		
		mav.setViewName("designer/portfolio");
		return mav;
	}
	
//	@RequestMapping("profile.do")
//	public ModelAndView profile() {
//		ModelAndView mav=new ModelAndView();
//		mav.setViewName("designer/profile");
//		return mav;
//	}
	
	@RequestMapping(value = "profile.do", method = RequestMethod.GET)
	public ModelAndView profileContent(HttpSession session) {
		
		//String path = servletContext.getRealPath("/");
		//System.out.println(path); // Path test code
		
		Object obj=session.getAttribute("login");
		MemberDTO mdto = (MemberDTO) obj;
		int u_idx=mdto.getU_idx();
		
		
		ProfileDTO pdto=designerService.profileInfo(u_idx);
		MemberDTO udto=designerService.userInfo(u_idx);
		ModelAndView mav=new ModelAndView();
		mav.addObject("pdto", pdto);
		mav.addObject("udto", udto);
		mav.addObject("u_idx", u_idx);
		mav.setViewName("designer/profile");
		return mav;
	}
	
	@RequestMapping(value = "profileInsert.do")
	public ModelAndView profileInsert(MultipartHttpServletRequest request, ProfileDTO dto) {
		String path=request.getSession().getServletContext().getRealPath("/profileimg/");
		capyInto(path, dto.getUpload());
		int result=designerService.profileInsert(dto);
		String msg=result>0?"ok":"no";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("gopage", "profile.do");
		mav.setViewName("designer/profileMsg");
		return mav;
	}
	
	@RequestMapping(value = "profileUpdate.do", method = RequestMethod.POST)
	public ModelAndView profileUpdate(MultipartHttpServletRequest request, ProfileDTO dto) {
		String path=request.getSession().getServletContext().getRealPath("/profileimg/");
		capyInto(path, dto.getUpload());
		dto.setP_img(dto.getUpload().getOriginalFilename());
		int result=designerService.profileUpdate(dto);
		
		
		String msg=result>0?"ok":"no";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("gopage", "profile.do");
		mav.setViewName("designer/profileMsg");
		return mav;
	}
	
	public void capyInto(String path,MultipartFile upload) {
		try {
			byte bytes[]=upload.getBytes();
			File f=new File(path+upload.getOriginalFilename());
			FileOutputStream fos=new FileOutputStream(f);
			fos.write(bytes);
			fos.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("review.do")
	public ModelAndView review(@RequestParam(value = "cp", defaultValue = "1") int cp, HttpSession session) {
		
		Object obj=session.getAttribute("login");
		MemberDTO mdto = (MemberDTO) obj;
		int u_idx=mdto.getU_idx();
		
		int totalCnt=designerService.reviewTotalCnt();
		int listSize=5;
		int pageSize=5;
		String pageStr=dsn.page.PageModule.pageMake("review.do", totalCnt, listSize, pageSize, cp);
		
		int win=designerService.designerWin(u_idx);
		ProfileDTO pdto=designerService.profileInfo(u_idx);
		MemberDTO udto=designerService.userInfo(u_idx);
		
		List lists=designerService.review(cp, listSize, u_idx);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("lists", lists);
		mav.addObject("pageStr", pageStr);
		
		mav.addObject("win", win);
		mav.addObject("pdto", pdto);
		mav.addObject("udto", udto);
		mav.addObject("u_idx", u_idx);
		
		mav.setViewName("designer/review");
		return mav;
	}
	@RequestMapping(value = "designer.do", method = RequestMethod.GET)
	public ModelAndView designer(@RequestParam(value = "cp", defaultValue = "1") int cp) {
		
		int totalCnt=designerService.designerListTotalCnt();
		int listSize=10;
		int pageSize=5;
		String pageStr=dsn.page.PageModule.pageMake("designer.do", totalCnt, listSize, pageSize, cp);
		
		List lists=designerService.designerList(cp, listSize);

		ModelAndView mav=new ModelAndView();
		
		mav.addObject("lists", lists);
		mav.addObject("pageStr", pageStr); 
		
		mav.setViewName("designer/designer");
		return mav;
	}
	
	//@RequestMapping()
	//public ModelAndView portfolioDetail(int d_idx) {
	//	DesignerDTO ddto=designerSevice.portfolioDetail(d_idx);
	//	ModelAndView mav=new ModelAndView();
	//	mav.addObject("ddto", ddto);
	//	return mav;
	//}
	
	
//	@RequestMapping(value = "designer.do", method = RequestMethod.GET)
//	public ModelAndView designer(@RequestParam(value = "cp", defaultValue = "1") int cp, DesignerDTO dto) {
//		ModelAndView mav=new ModelAndView();
//		
//		int totalCnt=designerSevice.designerTotalCnt();
//		int listSize=5;
//		int pageSize=5;
//		String pageStr=dsn.page.PageModule.pageMake("designer.do", totalCnt, listSize, pageSize, cp);
//		
////		List userlist=designerSevice.designerAllList();
////		for(int i=0;i<userlist.size();i++) {
////			
////			List photos=designerSevice.designPhotos((int) userlist.get(i));
////			mav.addObject("photos", photos);
////		}
//		List lists=designerSevice.designerList(cp, listSize);
////		ProfileDTO pdto=designerSevice.profileInfo(1);
//		
//		System.out.println("lists="+lists);
//
//		
//		
//		mav.addObject("lists", lists);
//		mav.addObject("pageStr", pageStr);
////		mav.addObject("pdto", pdto);
//		
//
//		mav.setViewName("designer/designer");
//		return mav;
//	}
}
