package dsn.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dsn.designer.model.DesignerService;
import dsn.review.model.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping("/allReview.do")
	public ModelAndView allReview(@RequestParam(value = "cp", defaultValue = "1") int cp) {
		
		int totalCnt=reviewService.reviewListTotalCnt();
		int listSize=5;
		int pageSize=5;
		String pageStr=dsn.page.PageModule.pageMake("allReview.do", totalCnt, listSize, pageSize, cp);
		
		List lists=reviewService.reviewList(cp, listSize);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("lists", lists);
		mav.addObject("pageStr", pageStr);
		
		mav.setViewName("review/allReview");
		return mav;
	}
	
	
}
