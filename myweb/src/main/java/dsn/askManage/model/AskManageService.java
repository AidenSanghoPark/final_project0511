package dsn.askManage.model;

import java.util.List;



public interface AskManageService {

		//문의 리스트 출력 메서드
		public List askList(int cp, int listSize);
		//상세정보 보는 메서드
		public AskManageDTO askContent(int q_idx);
		//페이징 관련
		public int getTotalCnt();
		//문의 확인 처리
		public int askCheckUpdate(AskManageDTO dto);
			
	
}
