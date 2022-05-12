package dsn.mypage.model;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface MyPageDAO {

	public List myPageList(Map map);
	public int userUpdate(MyPageDTO dto);
	public int pwdUpdate(String pwdconfirm);
	public int getTotalCnt();
	public List virtualWallet(Map map);
	public int getLastBalance();
	public List userInfoFind(Map map);
}