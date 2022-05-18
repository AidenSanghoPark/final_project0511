package dsn.contManage.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;




@Service
public class ContManageServiceImple implements ContManageService {

	private ContManageDAO contManageDao;
	
	public ContManageDAO getContManageDao() {
		return contManageDao;
	}

	public void setContManageDao(ContManageDAO contManageDao) {
		this.contManageDao = contManageDao;
	}

	
	@Override
	public int getTotalCnt() {
		int cnt = contManageDao.getTotalCnt();	
		cnt = cnt == 0 ? 1 : cnt ; 
		return cnt;
	}
	
	@Override
	public List contList(int cp, int listSize) {
		int start=((cp-1)*listSize)+1;
		int end=cp*listSize;
		Map map = new HashMap();
		map.put("start",start);
		map.put("end", end);
		List lists = contManageDao.contList(map);
		return lists;
	}
	
	@Override
	public ContManageDTO contContent(int c_idx) {
		ContManageDTO dto = contManageDao.contContent(c_idx);
		return dto;
	}

	@Override
	public int contBlockUpdate(ContManageDTO dto) {
		int count = contManageDao.contBlockUpdate(dto);
		return count;
	}
}
