package dsn.designer.model;

import java.util.*;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dsn.member.model.MemberDTO;
import dsn.profile.model.ProfileDTO;


public class DesignerServiceImple implements DesignerService {
	
	@Autowired
	private DesignerDAO DesignerDao;
	
	public DesignerDAO getDesignerDao() {
		return DesignerDao;
	}

	public void setDesignerDao(DesignerDAO designerDao) {
		this.DesignerDao = designerDao;
	}

	@Override
	public List portfolio(int cp, int listSize, int u_idx) {
		int start=((cp-1)*listSize)+1;
		int end=cp*listSize;
		Map map=new HashedMap();
		map.put("start", start);
		map.put("end", end);
		map.put("u_idx", u_idx);
		
		List lists=DesignerDao.portfolio(map);
		return lists;
	}
	
	@Override
	public List review(int cp, int listSize, int u_idx) {
		int start=((cp-1)*listSize)+1;
		int end=cp*listSize;
		Map map=new HashedMap();
		map.put("start", start);
		map.put("end", end);
		map.put("u_idx", u_idx);
		
		List lists=DesignerDao.review(map);
		return lists;
	}
	
	@Override
	public int profileInsert(ProfileDTO dto) {
		dto.setP_img(dto.getUpload().getOriginalFilename());
		int cnt=DesignerDao.profileInsert(dto);
		return cnt;
	}
	
	@Override
	public int profileUpdate(ProfileDTO dto) {
		if(dto.getP_img() == null || dto.getP_img().equals("")) {
			dto.setP_img(DesignerDao.profileInfo(dto.getU_idx()).getP_img());
		}
		int cnt=DesignerDao.profileUpdate(dto);
		return cnt;
	}
	
	@Override
	public ProfileDTO profileInfo(int u_idx) {
		ProfileDTO dto=DesignerDao.profileInfo(u_idx);
		return dto;
	}

	@Override
	public int portfolioTotalCnt() {
		int cnt=DesignerDao.portfolioTotalCnt();
		cnt=cnt==0?1:cnt;
		return cnt;
	}
	
	@Override
	public int reviewTotalCnt() {
		int cnt=DesignerDao.reviewTotalCnt();
		cnt=cnt==0?1:cnt;
		return cnt;
	}
	
	@Override
	public int designerTotalCnt() {
		int cnt=DesignerDao.designerTotalCnt();
		cnt=cnt==0?1:cnt;
		return cnt;
	}
	
	@Override
	public int designerWin(int u_idx) {
		int cnt=DesignerDao.designerWin(u_idx);
		return cnt;
	}
	
	@Override
	public MemberDTO userInfo(int u_idx) {
		MemberDTO dto=DesignerDao.userInfo(u_idx);
		return dto;
	}
	
	@Override
	public List designerList(int cp, int listSize) {
		int start=((cp-1)*listSize)+1;
		int end=cp*listSize;
		Map map=new HashedMap();
		map.put("start", start);
		map.put("end", end);
		
		List lists=DesignerDao.designerList(map);
		return lists;
	}
	
	@Override
	public List designPhotos(Object u_idx) {
		
		System.out.println("service="+u_idx);
		Map map=new HashedMap();
		map.put("u_idx", u_idx);
		
		List lists=DesignerDao.designPhotos(map);
		return lists;
	}
	public int designerListTotalCnt() {
		int cnt=DesignerDao.designerListTotalCnt();
		cnt=cnt==0?1:cnt;
		return cnt;
	}
	@Override
	public List designerAllList() {
		List lists=DesignerDao.designerAllList();
		return lists;
	}
	
	@Override
	public DesignerDTO portfolioDetail(int d_idx) {
		DesignerDTO dto=DesignerDao.portfolioDetail(d_idx);
		return dto;
	}
	
	

}
