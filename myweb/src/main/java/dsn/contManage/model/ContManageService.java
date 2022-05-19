package dsn.contManage.model;

import java.util.List;



public interface ContManageService {
	
	//페이징 관련
	public int getTotalCnt();
	
	//콘테스트리스트 출력 메서드
	public List contList(int cp, int listSize);
	
	//상세정보 보는 메서드
	public ContManageDTO contContent(int c_idx);

	//콘테스트 블럭처리
	public int contBlockUpdate(ContManageDTO dto);
}
