package dsn.withdrawManage.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import dsn.withdraw.model.WithDrawDTO;


@Service
public class WithdrawManageServiceImple implements WithdrawManageService {
	
	private WithdrawManageDAO withdrawManageDao;
	

	public WithdrawManageDAO getWithdrawManageDao() {
		return withdrawManageDao;
	}

	public void setWithdrawManageDao(WithdrawManageDAO withdrawManageDao) {
		this.withdrawManageDao = withdrawManageDao;
	}

	@Override
	public int withdrawStatusUpdate(WithDrawDTO dto) {
		int count = withdrawManageDao.withdrawStatusUpdate(dto);
		return count;
	}
	
	@Override
	public List withdrawList(int cp, int listSize) {
		int start=((cp-1)*listSize)+1;
		int end=cp*listSize;
		Map map = new HashMap();
		map.put("start",start);
		map.put("end", end);
		List lists = withdrawManageDao.withdrawList(map);
		return lists;
	}
	
	@Override
	public int getTotalCnt() {
		int cnt = withdrawManageDao.getTotalCnt();	
		cnt = cnt == 0 ? 1 : cnt ; 
		return cnt;
	}

	@Override
	public int accountInsert(WithDrawDTO dto) {
		int count = withdrawManageDao.accountInsert(dto);
		return count;
	}
	
	

}
