package dsn.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dsn.contest.model.ConDAO;
import dsn.contest.model.ConDAOImple;
import dsn.contest.model.ConDTO;
import dsn.contest.*;
import dsn.contest.model.ConService;

	@Controller
	public class ContestController {

	@Autowired
	private ConService conService;
	
	@RequestMapping(value = "/conList.do")
	   public ModelAndView conList(
			   @RequestParam(value="cp",defaultValue = "1") int cp,
			   @RequestParam(required = false, defaultValue = "전체") String c_cate) throws Exception {
	      
		   int totalCnt=10;
			int listSize=3;
			int pageSize=3;
			
			List lists = null;
			String p_command = "";
			if(c_cate.equals("전체")) {
				lists=conService.conList(cp,listSize);
			}else {
				lists = conService.cateList(cp, listSize, c_cate);
			}
			
			String pageStr=dsn.page.PageModule.pageMake(p_command, totalCnt, listSize, pageSize, cp);
			
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
	
/*	@RequestMapping("/conAudit.do")
	public ModelAndView conAudit(
			@RequestParam(value="cp",defaultValue = "1") int cp) {
		
//		int totalCnt=conService.getTotalCnt();
		int totalCnt=10;
		int listSize=3;
		int pageSize=3;
		String pageStr=dsn.page.PageModule.pageMake("conAudit.do", totalCnt, listSize, pageSize, cp);
		
		List lists=conService.conList(cp,listSize);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("pageStr",pageStr);
		mav.addObject("lists",lists);
		mav.setViewName("contest/conAudit");
		return mav;
	}
	
	@RequestMapping("/conEnd.do")
	public ModelAndView conEnd(
			@RequestParam(value="cp",defaultValue = "1") int cp) {
		
//		int totalCnt=conService.getTotalCnt();
		int totalCnt=10;
		int listSize=3;
		int pageSize=3;
		String pageStr=dsn.page.PageModule.pageMake("conEnd.do", totalCnt, listSize, pageSize, cp);
		
		List lists=conService.conList(cp,listSize,c_cate);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("pageStr",pageStr);
		mav.addObject("lists",lists);
		mav.setViewName("contest/conEnd");
		return mav;
	} */
	

	
/*	    @RequestMapping(value = "/list", method = RequestMethod.GET)

		public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {



		    model.addAttribute("list", service.listSearchCriteria(cri)); //전체목록에 검색페이징 기능+

		    int totalCnt=10;
			int listSize=3;
			int pageSize=3;
			String pageStr=dsn.page.PageModule.pageMake("cateList.do", totalCnt, listSize, pageSize, cp);
			
		    pageStr.setCri(cri);
		    pageStr.setTotalCount(service.listSearchCount(cri));//전체목록에 검색페이징 카운트+


		    ModelAndView mav=new ModelAndView();
		    mav.addObject("pageStr",pageStr);
			  mav.addObject("lists",lists);

		  } */
	
}
