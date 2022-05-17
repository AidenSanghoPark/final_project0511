package dsn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReviewController {
	
	@RequestMapping("/allReview.do")
	public ModelAndView allReview() {
		
		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("review/allReview");
		return mav;
	}
	
	
}
