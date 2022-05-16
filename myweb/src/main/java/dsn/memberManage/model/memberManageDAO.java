package dsn.memberManage.model;

import java.util.List;
import java.util.Map;

public interface memberManageDAO {
	
	//회원 리스트 출력 메서드
	public List memberList(Map map);
	//상세정보 보는 메서드
	public memberManageDTO memberContent(String u_id);
	//페이징 관련
	public int getTotalCnt();
}
