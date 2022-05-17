package dsn.mypage.model;

import java.util.List;

import dsn.member.model.MemberDTO;
import dsn.review.model.ReviewDTO;
import dsn.withdraw.model.WithDrawDTO;

public interface MyPageService {

	public int userUpdate(MemberDTO dto);
	public int pwdUpdate(String pwdconfirm,int u_idx);
	public int getTotalCnt(int u_idx);
	public List myPageList(int cp,int listSize, int u_idx);
	public List virtualWallet(int cp,int listSize, int u_idx);
	public int getLastBalance(int u_idx);
	public List userInfoFind(int u_idx);
	public String pwdFind(int u_idx);
	public int payout(WithDrawDTO dto);
	public int getWalletCnt(int u_idx);
	public int writeReview(ReviewDTO dto);
}
