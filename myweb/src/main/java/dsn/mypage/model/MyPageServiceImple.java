package dsn.mypage.model;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public int userUpdate(MyPageDTO dto) {
		int count=myPageDao.userUpdate(dto);	
		return count;
	}
	@Override
	public int pwdUpdate(String pwdconfirm) {
		int count=myPageDao.pwdUpdate(pwdconfirm);
		return count;
	}
	@Override
	public int getTotalCnt() {
		int cnt=myPageDao.getTotalCnt();
		cnt=cnt==0?1:cnt;
		return cnt;
	}
	@Override
	public List myPageList(int cp, int listSize) {
		int start=((cp-1)*listSize)+1;
		int end=cp*listSize;
		Map map=new HashedMap();
		map.put("start", start);
		map.put("end", end);
		List lists=myPageDao.myPageList(map);
		return lists;
	}

}