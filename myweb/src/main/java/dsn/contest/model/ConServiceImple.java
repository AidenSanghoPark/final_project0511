package dsn.contest.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dsn.trade.model.TrdDTO;

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
	public int contestJoin(DesingerDTO dto) {
		if(dto.getUploadfile1() != null|| dto.getUploadfile2() != null) {
			dto.setD_img_1(dto.getUploadfile1().getOriginalFilename());
			dto.setD_img_2(dto.getUploadfile2().getOriginalFilename());
		}
		return conDao.contestJoin(dto);
	}


	@Override
	public int addNaming(ConDTO dto) {
		System.out.println("service="+dto.getC_cate());
		System.out.println("service="+dto.getUpload().getOriginalFilename());
		//���ε尡 null �ƴҶ��� �������� ���ϳ��� �����ϱ�
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

	@Override
	public void updateTrd(ConDTO dto) {
		conDao.updateTrd(dto);
	}	

}