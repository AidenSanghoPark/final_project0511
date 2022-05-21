package dsn.withdrawManage.model;

import java.util.List;
import java.util.Map;

import dsn.withdraw.model.WithDrawDTO;


public interface WithdrawManageDAO {

	//페이징 관련
	public int getTotalCnt();
	
	//출품작 리스트
	public List withdrawList(Map map);

	//콘테스트 블록처리
	public int withdrawStatusUpdate(WithDrawDTO dto);

	public int accountInsert(WithDrawDTO dto);
}
