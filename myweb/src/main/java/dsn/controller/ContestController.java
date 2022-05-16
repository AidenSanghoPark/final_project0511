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
import dsn.page.PageModule;
import kr.co.vo.SearchCriteria;

	@Controller
	public class ContestController {

	@Autowired
	private ConService conService;
	
	@RequestMapping(value = "/conList.do")
	   public ModelAndView conList(
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
			
		}
		return null;
	}

	
}
