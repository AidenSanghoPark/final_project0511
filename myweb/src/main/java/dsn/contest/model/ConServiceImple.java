package dsn.contest.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

public class ConServiceImple implements ConService{
	
	private SqlSessionTemplate sqlMap;
	
	private ConDAO conDao;
	
	public ConDAO getConDao() {
		return conDao;
	}

	public void setConDao(ConDAO bbsDao) {
		this.conDao = bbsDao;
	}
	
/*	@Override
	public List conList(int cp, int listSize) {
		int start=((cp-1)*listSize)+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		List lists=conDao.conList(map);
		return lists;
	} */

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
	public List conList(int cp, int listSize) {
		int start=((cp-1)*listSize)+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		List lists=conDao.conList(map);
		return lists;
	}

	@Override
	public int dateUp() {
		int dateUp=conDao.dateUp();
		return dateUp;
	}


}
