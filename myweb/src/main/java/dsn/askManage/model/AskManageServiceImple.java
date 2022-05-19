package dsn.askManage.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;


@Service
public class AskManageServiceImple implements AskManageService {
	
	
	private AskManageDAO askManageDao;
	
	public AskManageDAO getAskManageDao() {
		return askManageDao;
	}

	public void setAskManageDao(AskManageDAO askManageDao) {
		this.askManageDao = askManageDao;
	}
	
	@Override
	public AskManageDTO askContent(int q_idx) {
		AskManageDTO dto = askManageDao.askContent(q_idx);
		return dto;
	}
	
	@Override
	public List askList(int cp, int listSize) {
		int start=((cp-1)*listSize)+1;
		int end=cp*listSize;
		Map map = new HashMap();
		map.put("start",start);
		map.put("end", end);
		List lists = askManageDao.askList(map);
		return lists;
	}
	
	@Override
	public int getTotalCnt() {
		int cnt = askManageDao.getTotalCnt();	
		cnt = cnt == 0 ? 1 : cnt ; 
		return cnt;
	}
	
	@Override
	public int askCheckUpdate(AskManageDTO dto) {
		int count = askManageDao.askCheckUpdate(dto);
		return count;
	}
	
	@Override
	public int askDel(int q_int) {
		int count = askManageDao.askDel(q_int);
		return count;
	}
	
	@Override
	public int askUpdate(AskManageDTO dto) {
		int count = askManageDao.askUpdate(dto);
		return count;
	}
	
	@Override
	public AskManageDTO askUpdateForm(int q_idx) {
		
		return askManageDao.askUpdateForm(q_idx);
	}
	@Override
	public int askWrite(AskManageDTO dto) {
		int count = askManageDao.askWrite(dto);
		return count;
	}

	@Override
	public int getUserTotalCnt(int u_idx) {
		int cnt = askManageDao.getUserTotalCnt(u_idx);
		cnt = cnt == 0 ? 1 : cnt ; 
		return cnt;
	}

	@Override
	public List askUserList(int cp, int listSize, int u_idx) {
		int start=((cp-1)*listSize)+1;
		int end=cp*listSize;
		Map map = new HashMap();
		map.put("start",start);
		map.put("end", end);
		map.put("u_idx", u_idx);
		List lists = askManageDao.askUserList(map); 
		return lists;
	}
	
}
