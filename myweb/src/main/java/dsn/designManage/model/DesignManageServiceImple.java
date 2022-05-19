package dsn.designManage.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;


@Service
public class DesignManageServiceImple implements DesignManageService {
	
	private DesignManageDAO designManageDao;
	
	public DesignManageDAO getDesignManageDao() {
		return designManageDao;
	}

	public void setDesignManageDao(DesignManageDAO designManageDao) {
		this.designManageDao = designManageDao;
	}

	@Override
	public int designBlockUpdate(DesignManageDTO dto) {
		int count = designManageDao.designBlockUpdate(dto);
		return count;
	}
	
	@Override
	public DesignManageDTO designContent(int d_idx) {
		DesignManageDTO dto = designManageDao.designContent(d_idx);
		return dto;
	}
	
	@Override
	public List designList(int cp, int listSize) {
		int start=((cp-1)*listSize)+1;
		int end=cp*listSize;
		Map map = new HashMap();
		map.put("start",start);
		map.put("end", end);
		List lists = designManageDao.designList(map);
		return lists;
	}
	
	@Override
	public int getTotalCnt() {
		int cnt = designManageDao.getTotalCnt();	
		cnt = cnt == 0 ? 1 : cnt ; 
		return cnt;
	}
	
	

}
