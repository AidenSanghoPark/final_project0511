package dsn.mypage.model;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dsn.member.model.MemberDTO;
import dsn.review.model.ReviewDTO;
import dsn.trade.model.TradeDTO;
import dsn.withdraw.model.WithDrawDTO;

@Service
public class MyPageServiceImple implements MyPageService {
	
	@Autowired
	private MyPageDAO myPageDao;
	
	public MyPageDAO getMyPageDao() {
		return myPageDao;
	}

	public void setMyPageDao(MyPageDAO myPageDao) {
		this.myPageDao = myPageDao;
	}

	@Override
	public int userUpdate(MemberDTO dto) {
		int count=myPageDao.userUpdate(dto);	
		return count;
	}
	@Override
	public String pwdFind(int u_idx) {
		String u_pwd=myPageDao.pwdFind(u_idx);
		return u_pwd;
	}
	@Override
	public int pwdUpdate(String pwdconfirm,int u_idx) {
		Map map=new HashedMap();
		map.put("pwdconfirm", pwdconfirm);
		map.put("u_idx", u_idx);
		int count=myPageDao.pwdUpdate(map);
		return count;
	}
	@Override
	public int getTotalCnt(int u_idx) {
		int cnt=myPageDao.getTotalCnt(u_idx);
		cnt=cnt==0?1:cnt;
		return cnt;
	}
	@Override
	public List myPageList(int cp, int listSize, int u_idx) {

		int start=((cp-1)*listSize)+1;
		int end=cp*listSize;
		
		Map map=new HashedMap();
		map.put("start", start);
		map.put("end", end);
		map.put("u_idx", u_idx);
		List lists=myPageDao.myPageList(map);
		return lists;
	}
	@Override
	public List virtualWallet(int cp, int listSize, int u_idx) {
		int start=((cp-1)*listSize)+1;
		int end=cp*listSize;
		Map map=new HashedMap();
		map.put("start", start);
		map.put("end", end);
		map.put("u_idx", u_idx);
		List lists=myPageDao.virtualWallet(map);
		return lists;
	}
	@Override
	public int getLastBalance(int u_idx) {
		
		int blc=myPageDao.getLastBalance(u_idx);
		return blc;
	}
	@Override
	public List userInfoFind(int u_idx) {
		Map map=new HashedMap();
		map.put("u_idx", u_idx);
		List userinfo=myPageDao.userInfoFind(map);
		return userinfo;
	}
	@Override
	public int payout(WithDrawDTO dto) {
		int count=myPageDao.payout(dto);
		return count;
	}
	@Override
	public int getWalletCnt(int u_idx) {
		int cnt=myPageDao.getWalletCnt(u_idx);
		cnt=cnt==0?1:cnt;
		return cnt;
	}
	@Override
	public int writeReview(ReviewDTO dto) {
		int count=myPageDao.writeReview(dto);
		return count;
	}
	@Override
	public List showPayInfo(int cp, int listSize, int u_idx) {
		
		int start=((cp-1)*listSize)+1;
		int end=cp*listSize;
		
		Map map=new HashedMap();
		map.put("start", start);
		map.put("end", end);
		map.put("u_idx", u_idx);
		List lists=myPageDao.showPayInfo(map);
		return lists;
	}
	@Override
	public int getTradeCnt(int u_idx) {
		int cnt=myPageDao.getTradeCnt(u_idx);
		cnt=cnt==0?1:cnt;
		return cnt;
	}
}