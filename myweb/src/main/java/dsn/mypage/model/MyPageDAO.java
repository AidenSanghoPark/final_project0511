package dsn.mypage.model;

import java.util.List;
import java.util.Map;

import dsn.member.model.MemberDTO;
import dsn.review.model.ReviewDTO;
import dsn.withdraw.model.WithDrawDTO;

public interface MyPageDAO {

	public List myPageList(Map map);
	public int userUpdate(MemberDTO dto);
	public int pwdUpdate(Map map);
	public int getTotalCnt(int u_idx);
	public List virtualWallet(Map map);
	public int getLastBalance(int u_idx);
	public List userInfoFind(Map map);
	public String pwdFind(int u_idx);
	public int payout(WithDrawDTO dto);
	public int getWalletCnt(int u_idx);
	public int writeReview(ReviewDTO dto);
}