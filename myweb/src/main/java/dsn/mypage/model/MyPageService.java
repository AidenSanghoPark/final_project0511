package dsn.mypage.model;

import java.util.List;
import java.util.Map;

import dsn.member.model.MemberDTO;
import dsn.profile.model.ProfileDTO;
import dsn.review.model.ReviewDTO;
import dsn.trade.model.TradeDTO;
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
	public int writeReview(int u_idx,String rv_content);
	public List showPayInfo(int cp,int listSize, int u_idx);
	public int getTradeCnt(int u_idx);
	public List myPageListByDesigner(int cp, int listSize, int u_idx);
	public int getDesignerCnt(int u_idx);
	public ProfileDTO getProfileWalletInfo(int u_idx);
}
