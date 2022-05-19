package dsn.askManage.model;

import java.util.List;
import java.util.Map;




public interface AskManageDAO {
	
	//문의리스트
	public List askList(Map map);
	//문의내용
	public AskManageDTO askContent(int q_idx);
	//페이징 관련
	public int getTotalCnt();
	//문의 확인 처리
	public int askCheckUpdate(AskManageDTO dto);
	//문의 삭제
	public int askDel(int q_int);
	//문의 편집
	public AskManageDTO askUpdateForm(int q_int);	
	//문의 편집
	public int askUpdate(AskManageDTO dto);	
	//문의 등록
	public int askWrite(AskManageDTO dto);
	//유저 페이징 관련
	public int getUserTotalCnt(int u_idx);
	//유저 문의 리스트
	public List askUserList(Map map);
}
