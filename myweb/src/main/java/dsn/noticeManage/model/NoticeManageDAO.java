package dsn.noticeManage.model;

import java.util.List;
import java.util.Map;



public interface NoticeManageDAO {

	//공지 리스트
	public List noticeList(Map map);
	//공지 내용
	public NoticeManageDTO noticeContent(int n_idx);
	//페이징 관련
	public int getTotalCnt();
	//공지 삭제
	public int noticeDel(int n_int);
	//공지 편집
	public NoticeManageDTO noticeUpdateForm(int n_idx);	
	//공지 편집
	public int noticeUpdate(NoticeManageDTO dto);	
	//공지 등록
	public int noticeWrite(NoticeManageDTO dto);
	
	
}
