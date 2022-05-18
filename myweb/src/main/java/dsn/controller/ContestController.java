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
import dsn.contest.model.ConDTO;
import dsn.contest.model.ConService;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import dsn.contest.model.*;
import dsn.module.*;
import dsn.trade.model.TrdDTO;

@Controller
public class ContestController {
	
	@Autowired
	private ConService conService;
	
	//���׽�Ʈ Ÿ��
	@RequestMapping("/contestChoice.do")
	public ModelAndView contestHold() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("contest/contestChoice");
		return mav;
	}
	//���̹� ��
	@RequestMapping(value = "/namingHold.do", method = RequestMethod.GET)
	public ModelAndView namingHoldView(@RequestParam(value="c_cate", defaultValue="")String c_cate) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("c_cate", c_cate);
		mav.setViewName("contest/namingHold");
		return mav;
	}
	//üũ �ڽ�
	@RequestMapping(value = "/arrcheck.do", method = RequestMethod.POST)
	@ResponseBody
	public void arrCheck(@RequestParam(value = "valueArr[]")
						List<String> valueArr) {
	   		System.out.println(valueArr);
	}
	//���̹� form
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
		mav.setViewName("contest/logoHold"); //임시방편 jsp 경로 바꿔야함
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
	public ModelAndView contestJoinForm(MultipartHttpServletRequest request ,DesingerDTO dto) {
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
	
	
}
