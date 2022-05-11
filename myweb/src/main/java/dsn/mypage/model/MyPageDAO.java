package dsn.mypage.model;

import java.util.List;
import java.util.Map;

public interface MyPageDAO {

	public List myPageList(Map map);
	public int userUpdate(MyPageDTO dto);
	public int pwdUpdate(String pwdconfirm);
	public int getTotalCnt();
	
}