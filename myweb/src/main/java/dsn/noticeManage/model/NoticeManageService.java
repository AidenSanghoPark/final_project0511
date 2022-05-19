package dsn.noticeManage.model;

import java.util.List;


public interface NoticeManageService {
	
	//공지리스트 출력 메서드
	public List noticeList(int cp, int listSize);
	//상세정보 보는 메서드
	public NoticeManageDTO noticeContent(int n_idx);
	//페이징 관련
	public int getTotalCnt();
	//공지 삭제
	public int noticeDel(int n_int);
	//공지 편집 이동
	public NoticeManageDTO noticeUpdateForm(int n_idx);
	//공지 편집
	public int noticeUpdate(NoticeManageDTO dto);
	//공지 등록
	public int noticeWrite(NoticeManageDTO dto);
	
	

}
