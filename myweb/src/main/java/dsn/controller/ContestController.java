package dsn.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import dsn.contest.model.*;
import dsn.module.*;

@Controller
public class ContestController {
	
	@Autowired
	private ConService conService;
	
	@RequestMapping(value = "contestJoin.do", method = RequestMethod.GET)
	public ModelAndView contestJoin(ConDTO dto) {
		ModelAndView mav=new ModelAndView();
		ConDTO con=conService.conInfo(1);
		mav.addObject("condto", con);
		mav.setViewName("contest/contestJoin");
		return mav;
	}
	@RequestMapping(value = "contestJoin.do", method = RequestMethod.POST)
	public ModelAndView contestJoinForm(MultipartHttpServletRequest request ,DesingerDTO dto) {
		ModelAndView mav=new ModelAndView();
		FileUploadModule file=new FileUploadModule();
		String path=request.getSession().getServletContext().getRealPath("img/");
		file.copyInto(path,dto.getUploadfile1());
		file.copyInto(path,dto.getUploadfile2());
		int result=conService.contestJoin(dto);
		mav.setViewName("myweb/index");
		return mav;
	}
}
