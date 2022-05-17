package dsn.controller;

import java.io.File;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import dsn.member.model.MemberService;
import dsn.contest.model.*;
@Controller
public class ContestController {
	
	@Autowired
	private ConService conService;
	
	//콘테스트 타입
	@RequestMapping("/contestChoice.do")
	public ModelAndView contestHold() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("contest/contestChoice");
		return mav;
	}
	//로고 뷰
	@RequestMapping(value = "/logoHold.do", method = RequestMethod.GET)
	public ModelAndView logoHoldView(@RequestParam(value="c_cate", defaultValue="")String c_cate) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("c_cate", c_cate);
		mav.setViewName("contest/logoHold");
		return mav;
	}
	//체크박스
	@RequestMapping(value = "/arrcheck.do", method = RequestMethod.POST)
	@ResponseBody
	public void arrCheck(@RequestParam(value = "valueArr[]")
	                  List<String> valueArr) {
	            System.out.println(valueArr);
	}
	//로고 form
	@RequestMapping(value = "/logoHold_add.do", method = RequestMethod.POST)
	@ResponseBody
	public String logoHoldForm(MultipartHttpServletRequest request, ConDTO dto) {   
	      
	   Date date = new Date();
	   
	   
	   int result = conService.addLogo(dto);
	   int pay=(int) ((dto.getC_pay()*10)+(dto.getC_pay()*1.1)+dto.getC_pay());
	   	   
	   TradeDTO tdto=new TradeDTO();
	   tdto.setT_pay(pay);
	   tdto.setU_idx(dto.getU_idx());
	   
	   System.out.println("t_pay"+tdto.getT_pay());
	   System.out.println("u_idx"+tdto.getU_idx());
	   
	   String path = request.getSession().getServletContext().getRealPath("img/");
	   copyInto(dto.getUpload(), path); 
	   return result + "";
	}
	//파일복사
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
	//네이밍 개최
	@RequestMapping(value = "/namingHold.do", method = RequestMethod.GET)
	public ModelAndView rogoHold(@RequestParam(value="c_cate", defaultValue="")String c_cate) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("c_cate", c_cate);
		System.out.println(c_cate);
		mav.setViewName("contest/namingHold");
		return mav;
	}
	//네이밍 form
	@RequestMapping(value = "/namingHold_add.do", method = RequestMethod.POST)
	@ResponseBody
	public String namingHoldForm(MultipartHttpServletRequest request, ConDTO dto) { 
			      
		int result = conService.addNaming(dto);
		String path = request.getSession().getServletContext().getRealPath("img/");
		copyInto(dto.getUpload(), path); 
		return result + "";
	}
	
	//캐릭터 개최
	@RequestMapping(value = "/characterHold.do", method = RequestMethod.GET)
	public ModelAndView characterHold(@RequestParam(value="c_cate", defaultValue="")String c_cate) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("c_cate", c_cate);
		System.out.println(c_cate);
		mav.setViewName("contest/characterHold");
		return mav;
	}
	//캐릭터 form
	@RequestMapping(value = "/characterHold_add.do", method = RequestMethod.POST)
	@ResponseBody
	public String characterHoldorm(MultipartHttpServletRequest request, ConDTO dto) {   
			      
		int result = conService.addCharacter(dto);
		String path = request.getSession().getServletContext().getRealPath("img/");
		copyInto(dto.getUpload(), path); 
		return result + "";
	}
	//인쇄 개최
	@RequestMapping(value = "/printHold.do", method = RequestMethod.GET)
	public ModelAndView printHold(@RequestParam(value="c_cate", defaultValue="")String c_cate) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("c_cate", c_cate);
		System.out.println(c_cate);
		mav.setViewName("contest/printHold");
		return mav;
	}
	//인새 form
	@RequestMapping(value = "/printHold_add.do", method = RequestMethod.POST)
	@ResponseBody
	public String printrHoldForm(MultipartHttpServletRequest request, ConDTO dto) {   
			      
		int result = conService.addPrint(dto);
		String path = request.getSession().getServletContext().getRealPath("img/");
		copyInto(dto.getUpload(), path); 
		return result + "";
	}

}
