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
	private DesignerService designerSevice;
	
	@Autowired ServletContext servletContext;
	
	@RequestMapping("portfolio.do")
	public ModelAndView portfolio(@RequestParam(value = "cp", defaultValue = "1") int cp, HttpSession session) {
		
		int u_idx=(int)session.getAttribute("u_idx");
		
		int totalCnt=designerSevice.portfolioTotalCnt();
		int listSize=5;
		int pageSize=5;
		String pageStr=dsn.page.PageModule.pageMake("portfolio.do", totalCnt, listSize, pageSize, cp);
		
		List lists=designerSevice.portfolio(cp, listSize, u_idx);
		
		int win=designerSevice.designerWin(u_idx);
		ProfileDTO pdto=designerSevice.profileInfo(u_idx);
		MemberDTO udto=designerSevice.userInfo(u_idx);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("lists", lists);
		mav.addObject("pageStr", pageStr);
		
		mav.addObject("win", win);
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
		
		int u_idx=(int)session.getAttribute("u_idx");
		
		int win=designerSevice.designerWin(u_idx);
		ProfileDTO pdto=designerSevice.profileInfo(u_idx);
		MemberDTO udto=designerSevice.userInfo(u_idx);
		ModelAndView mav=new ModelAndView();
		mav.addObject("win", win);
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
		int result=designerSevice.profileInsert(dto);
		String msg=result>0?"프로필 사진 업로드 완료":"프로필 사진 업로드 실패";
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
		int result=designerSevice.profileUpdate(dto);
		
		System.out.println(dto.getP_img());
		
		String msg=result>0?"프로필 사진 수정 완료":"프로필 사진 수정 실패";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("gopage", "profile.do");
		mav.setViewName("designer/profileMsg");
		return mav;
	}
	
	/**사진 업로드 관련 메서드*/
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
		
		int u_idx=(int)session.getAttribute("u_idx");
		
		int totalCnt=designerSevice.reviewTotalCnt();
		int listSize=5;
		int pageSize=5;
		String pageStr=dsn.page.PageModule.pageMake("review.do", totalCnt, listSize, pageSize, cp);
		
		int win=designerSevice.designerWin(u_idx);
		ProfileDTO pdto=designerSevice.profileInfo(u_idx);
		MemberDTO udto=designerSevice.userInfo(u_idx);
		
		List lists=designerSevice.review(cp, listSize, u_idx);
		
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
		
		int totalCnt=designerSevice.designerListTotalCnt();
		int listSize=10;
		int pageSize=5;
		String pageStr=dsn.page.PageModule.pageMake("designer.do", totalCnt, listSize, pageSize, cp);
		
		List lists=designerSevice.designerList(cp, listSize);

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
	//	mav.setViewName("des");
	//}
}
