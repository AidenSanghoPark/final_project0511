package dsn.reportManage.model;

import java.util.List;
import java.util.Map;

public interface ReportManageService {
	
	//페이징 관련
	public int getTotalCnt();
	
	//신고 리스트
	public List reportList(int cp, int listSize);
	
	//신고 내용
	public ReportManageDTO reportContent(int r_idx);

	//신고 확인 처리
	public int reportCheckUpdate(ReportManageDTO dto);

}
