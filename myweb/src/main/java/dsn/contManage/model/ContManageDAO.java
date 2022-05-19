package dsn.contManage.model;

import java.util.List;
import java.util.Map;





public interface ContManageDAO {

	//페이징 관련
	public int getTotalCnt();
	
	//콘테스트 리스트
	public List contList(Map map);
	
	//콘테스트 내용
	public ContManageDTO contContent(int c_idx);

	//콘테스트 블록처리
	public int contBlockUpdate(ContManageDTO dto);
}
