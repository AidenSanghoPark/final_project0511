package dsn.mypage.model;

import java.util.List;

import dsn.member.model.MemberDTO;

public interface MyPageService {

	public int userUpdate(MemberDTO dto);
	public int pwdUpdate(String pwdconfirm);
	public int getTotalCnt();
	public List myPageList(int cp,int listSize, int u_idx);
	public List virtualWallet(int cp,int listSize, int u_idx);
	public int getLastBalance(int u_idx);
	public List userInfoFind(int u_idx);
	public String pwdFind(int u_idx);
}
