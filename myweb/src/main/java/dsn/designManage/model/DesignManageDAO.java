package dsn.designManage.model;

import java.util.List;
import java.util.Map;


public interface DesignManageDAO {

	//페이징 관련
	public int getTotalCnt();
	
	//출품작 리스트
	public List designList(Map map);
	
	//출품내용
	public DesignManageDTO designContent(int d_idx);

	//콘테스트 블록처리
	public int designBlockUpdate(DesignManageDTO dto);
}
