package dsn.mypage.model;

import java.util.List;

public interface MyPageService {

	public int userUpdate(MyPageDTO dto);
	public int pwdUpdate(String pwdconfirm);
	public int getTotalCnt();
	public List myPageList(int cp,int listSize, int u_idx);
	public List virtualWallet(int cp,int listSize);
	public int getLastBalance();
	public List userInfoFind(int u_idx);
}
