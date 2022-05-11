package dsn.mypage.model;

import java.util.List;

public interface MyPageService {

	public int userUpdate(MyPageDTO dto);
	public int pwdUpdate(String pwdconfirm);
	public int getTotalCnt();
	public List myPageList(int cp,int listSize);
}
