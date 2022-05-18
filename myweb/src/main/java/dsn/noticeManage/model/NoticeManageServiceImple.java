package dsn.noticeManage.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;




@Service
public class NoticeManageServiceImple implements NoticeManageService {

	private NoticeManageDAO noticeManageDao;
	
	public NoticeManageDAO getNoticeManageDao() {
		return noticeManageDao;
	}

	public void setNoticeManageDao(NoticeManageDAO noticeManageDao) {
		this.noticeManageDao = noticeManageDao;
	}

	@Override
	public int getTotalCnt() {
		int cnt = noticeManageDao.getTotalCnt();	
		cnt = cnt == 0 ? 1 : cnt ; 
		return cnt;
	}
	
	@Override
	public NoticeManageDTO noticeContent(int n_idx) {
		NoticeManageDTO dto = noticeManageDao.noticeContent(n_idx);
		return dto;
	}
	
	@Override
	public List noticeList(int cp, int listSize) {
		int start=((cp-1)*listSize)+1;
		int end=cp*listSize;
		Map map = new HashMap();
		map.put("start",start);
		map.put("end", end);
		List lists = noticeManageDao.noticeList(map);
		return lists;
	}
	
	@Override
	public int noticeDel(int n_int) {
		int count = noticeManageDao.noticeDel(n_int);
		return count;
	}
	
	@Override
	public NoticeManageDTO noticeUpdateForm(int n_idx) {
		return noticeManageDao.noticeUpdateForm(n_idx);
	}
	
	@Override
	public int noticeUpdate(NoticeManageDTO dto) {
		int count = noticeManageDao.noticeUpdate(dto);
		return count;
	}
	
	@Override
	public int noticeWrite(NoticeManageDTO dto) {
		int count = noticeManageDao.noticeWrite(dto);	
		return count;
	}
	
}
