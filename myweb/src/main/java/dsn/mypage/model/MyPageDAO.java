package dsn.mypage.model;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import dsn.member.model.MemberDTO;

public interface MyPageDAO {

	public List myPageList(Map map);
	public int userUpdate(MemberDTO dto);
	public int pwdUpdate(String pwdconfirm);
	public int getTotalCnt();
	public List virtualWallet(Map map);
	public int getLastBalance(int u_idx);
	public List userInfoFind(Map map);
	public String pwdFind(int u_idx);
}