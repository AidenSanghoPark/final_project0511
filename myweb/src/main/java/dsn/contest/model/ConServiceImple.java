package dsn.contest.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dsn.contest.model.*;
import dsn.designer.model.DesignerDTO;
import dsn.trade.model.TrdDTO;

@Service
public class ConServiceImple implements ConService{
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	private ConDAO conDao;
	
	public ConDAO getConDao() {
		return conDao;
	}

	public void setConDao(ConDAO bbsDao) {
		this.conDao = bbsDao;
	}
	

	@Override
	public List cateList(int cp, int listSize, String c_cate) {
		int start=((cp-1)*listSize)+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("c_cate", c_cate);
		List lists=conDao.cateList(map);
		return lists;
	}

	@Override
	public List conList(int cp, int listSize, String searchType, String keyword) {
		int start=((cp-1)*listSize)+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("searchType",searchType);
		map.put("keyword", keyword);
		List lists=conDao.conList(map);
		return lists;
	}
	
	@Override
	public List cateEnd(int cp, int listSize, String c_cate) {
		int start=((cp-1)*listSize)+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("c_cate", c_cate);
		List lists=conDao.cateEnd(map);
		return lists;
	}

	@Override
	public List conEnd(int cp, int listSize, String searchType, String keyword) {
		int start=((cp-1)*listSize)+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("searchType",searchType);
		map.put("keyword", keyword);
		List lists=conDao.conEnd(map);
		return lists;
	}

	@Override
	public int dateUp() {
		int dateUp=conDao.dateUp();
		return dateUp;
	}

	@Override
	public int ContestCnt() {
		int cnt=conDao.ContestCnt();
		cnt=cnt==0?1:cnt;
		return cnt;
	}
	
	@Override
	public ConDTO conContent(int c_idx) {
		ConDTO dto=conDao.conContent(c_idx);
		int readnum=dto.getC_readnum();
		dto.setC_readnum(readnum);
		readnum++;
		conCount(readnum,dto.getC_idx());
		return dto;
	}
	@Override
	public ConDTO conContent2(int c_idx) {
		ConDTO dto=conDao.conContent(c_idx);
		return dto;
	}

	@Override
	public int conCount(int c_readnum, int c_idx) {
		Map map=new HashedMap();
		map.put("c_readnum", c_readnum);
		map.put("c_idx", c_idx);
		
		int count=conDao.conCount(map);
		return count;
		
	}
	
	@Override
	public ConDTO conInfo(int c_idx) {
		return conDao.conInfo(c_idx);
	}
	@Override
	public int contestJoin(DesignerConDTO dto) {
		if(dto.getUploadfile1() != null|| dto.getUploadfile2() != null) {
			dto.setD_img_1(dto.getUploadfile1().getOriginalFilename());
			dto.setD_img_2(dto.getUploadfile2().getOriginalFilename());
		}
		return conDao.contestJoin(dto);
	}
	@Override
	public int addLogo(ConDTO dto) {
		System.out.println("service="+dto.getC_cate());
		System.out.println("service="+dto.getUpload().getOriginalFilename());
		if(dto.getUpload() != null) {
			dto.setC_file(dto.getUpload().getOriginalFilename());
		}
		int count = conDao.addLogo(dto);
		return count;
	}

	@Override
	public void updateTrd(ConDTO dto) {
		conDao.updateTrd(dto);
	}	
	@Override
	public void contestEnd(int c_idx) {
		System.out.println("contestEnd="+c_idx);
		conDao.contestEnd(c_idx);
		
	}@Override
	public void designerWin(int d_idx) {
		System.out.println("designerWin="+d_idx);
		conDao.designerWin(d_idx);
	}	
	
	@Override
	public DesignerConDTO contestContent(int d_idx, int c_idx) {
		Map map=new HashedMap();
		map.put("d_idx", d_idx);
		map.put("c_idx", c_idx);
		DesignerConDTO dto=conDao.contestContent(map);
		return dto;
	}
	@Override
	public void payUpdate(int u_idx,int a_amount,int uidx,int amount) {
		Map map=new HashedMap();
		map.put("u_idx", u_idx);
		map.put("a_amount", a_amount);
		map.put("uidx", uidx);
		map.put("amount", amount);
		conDao.payUpdate(map);
		
	}
	@Override
	public int designerUser(int d_idx) {
		return conDao.designerUser(d_idx);
	}
	
	@Override
	public int contestPay(int c_idx) {
		return conDao.contestPay(c_idx);
	}


	@Override
	public List conPart(int cp, int listSize, int c_idx) {
		int start=((cp-1)*listSize)+1;
		int end=cp*listSize;
		Map map=new HashedMap();
		map.put("start", start);
		map.put("end", end);
		map.put("c_idx", c_idx);
		
		List dlists=conDao.conPart(map);
		return dlists;
	}
	
	@Override
	public int designInfo(int d_idx, int c_idx) {
		Map map=new HashedMap();
		map.put("d_idx", d_idx);
		map.put("c_idx", c_idx);
		int count=conDao.designInfo(map);
		return count;
	}



	@Override
	public int addLogoTrade(TrdDTO dto) {
		int count = conDao.addLogoTrade(dto);
		return count;
	}
	//naming
	@Override
	public int addNaming(ConDTO dto) {
		if(dto.getUpload() != null) {
			dto.setC_file(dto.getUpload().getOriginalFilename());
		}
		int count = conDao.addNaming(dto);
		return count;
	}
	@Override
	public int addNamingTrade(TrdDTO dto) {
		int count = conDao.addNamingTrade(dto);
		return count;
	}
	//char
	@Override
	public int addChar(ConDTO dto) {
		if(dto.getUpload() != null) {
			dto.setC_file(dto.getUpload().getOriginalFilename());
		}
		int count = conDao.addChar(dto);
		return count;
	}
	@Override
	public int addCharTrade(TrdDTO dto) {
		int count = conDao.addCharTrade(dto);
		return count;
	}
	//print
	@Override
	public int addPrint(ConDTO dto) {
		if(dto.getUpload() != null) {
			dto.setC_file(dto.getUpload().getOriginalFilename());
		}
		int count = conDao.addPrint(dto);
		return count;
	}
	@Override
	public int addPrintTrade(TrdDTO dto) {
		int count = conDao.addPrintTrade(dto);
		return count;
	}

	@Override
	public DesignerDTO conPartContent(int d_idx) {
		DesignerDTO dto = conDao.conPartContent(d_idx);
		return dto;
	}


}
