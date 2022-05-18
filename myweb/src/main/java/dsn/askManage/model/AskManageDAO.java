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
}
