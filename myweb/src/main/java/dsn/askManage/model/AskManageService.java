package dsn.askManage.model;

import java.util.List;
import java.util.Map;




public interface AskManageService {

		//문의 리스트 출력 메서드
		public List askList(int cp, int listSize);
		//상세정보 보는 메서드
		public AskManageDTO askContent(int q_idx);
		//페이징 관련
		public int getTotalCnt();
		//문의 확인 처리
		public int askCheckUpdate(AskManageDTO dto);
		//공지 삭제
		public int askDel(int q_int);
		//공지 편집 이동
		public AskManageDTO askUpdateForm(int q_idx);
		//공지 편집
		public int askUpdate(AskManageDTO dto);
		//공지 등록
		public int askWrite(AskManageDTO dto);
		//유저 페이징 관련
		public int getUserTotalCnt(int u_idx);
		//유저 문의 리스트
		public List askUserList(int cp, int listSize, int u_idx);
			
	
}
