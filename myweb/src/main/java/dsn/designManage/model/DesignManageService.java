package dsn.designManage.model;

import java.util.List;

public interface DesignManageService {

	//페이징 관련
	public int getTotalCnt();
	
	//출품작 리스트
	public List designList(int cp, int listSize);
	
	//출품내용
	public DesignManageDTO designContent(int d_idx);

	//콘테스트 블록처리
	public int designBlockUpdate(DesignManageDTO dto);
}
