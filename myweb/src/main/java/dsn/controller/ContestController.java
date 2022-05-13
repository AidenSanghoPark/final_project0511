package dsn.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

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
import dsn.contest.model.ConDTO;
import dsn.contest.model.ConService;
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
	//네이밍 뷰
	@RequestMapping(value = "/namingHold.do", method = RequestMethod.GET)
	public ModelAndView namingHoldView(@RequestParam(value="c_cate", defaultValue="")String c_cate) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("c_cate", c_cate);
		mav.setViewName("contest/namingHold");
		return mav;
	}
	//체크 박스
	@RequestMapping(value = "/arrcheck.do", method = RequestMethod.POST)
	@ResponseBody
	public void arrCheck(@RequestParam(value = "valueArr[]")
						List<String> valueArr) {
	   		System.out.println(valueArr);
	}
	//네이밍 form
	@RequestMapping(value = "/namingHold_add.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView namingHoldForm(MultipartHttpServletRequest request, ConDTO dto) {	
		
		ModelAndView mav=new ModelAndView();
		System.out.println(dto.getC_cate());
		System.out.println(dto.getUpload().getOriginalFilename());	
		int result = conService.addNaming(dto);
		mav.addObject("result", result);
		mav.addObject("upload", dto.getUpload());
		String path = request.getSession().getServletContext().getRealPath("img/");
		copyInto(dto.getUpload(), path); 
		mav.setViewName("contest/namingHold");
		return mav;
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
	//로고 개최
	@RequestMapping(value = "/logoHold.do", method = RequestMethod.GET)
	public ModelAndView rogoHold(@RequestParam(value="c_cate", defaultValue="")String c_cate) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("c_cate", c_cate);
		System.out.println(c_cate);
		mav.setViewName("contest/logoHold");
		return mav;
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
	//제품 개최
	@RequestMapping(value = "/productHold.do", method = RequestMethod.GET)
	public ModelAndView productHold(@RequestParam(value="c_cate", defaultValue="")String c_cate) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("c_cate", c_cate);
		System.out.println(c_cate);
		mav.setViewName("contest/productHold");
		return mav;
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
}
