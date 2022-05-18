package dsn.reportManage.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;


@Service
public class ReportManageServiceImple implements ReportManageService {

	private ReportManageDAO reportManageDao;
	
	public ReportManageDAO getReportManageDao() {
		return reportManageDao;
	}
	public void setReportManageDao(ReportManageDAO reportManageDao) {
		this.reportManageDao = reportManageDao;
	}
	
	@Override
	public int getTotalCnt() {
		int cnt = reportManageDao.getTotalCnt();	
		cnt = cnt == 0 ? 1 : cnt ; 
		return cnt;
	}
	@Override
	public int reportCheckUpdate(ReportManageDTO dto) {
		int count = reportManageDao.reportCheckUpdate(dto);
		return count;
	}
	@Override
	public ReportManageDTO reportContent(int r_idx) {
		ReportManageDTO dto = reportManageDao.reportContent(r_idx);
		return dto;
	}
	@Override
	public List reportList(int cp, int listSize) {
		int start=((cp-1)*listSize)+1;
		int end=cp*listSize;
		Map map = new HashMap();
		map.put("start",start);
		map.put("end", end);
		List lists = reportManageDao.reportList(map);
		return lists;
	}
	
}
