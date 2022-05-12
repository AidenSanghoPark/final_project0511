package dsn.mypage.model;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;

public class MyPageDAOImple implements MyPageDAO {

	private SqlSessionTemplate sqlMap;
	
	public MyPageDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap=sqlMap;
	}
	
	@Override
	public int userUpdate(MyPageDTO dto) {
		int count=sqlMap.update("userUpdate", dto);
		return count;
	}
	@Override
	public int pwdUpdate(String pwdconfirm) {
		int count=sqlMap.update("pwdUpdate", pwdconfirm);
		return count;
	}
	@Override
	public int getTotalCnt() {
		int cnt=sqlMap.selectOne("totalCnt");
		return cnt;
	}
	@Override
	public List myPageList(Map map) {
		List lists=sqlMap.selectList("myPageList", map);
		return lists;
	}
	@Override
	public List virtualWallet(Map map) {
		List lists=sqlMap.selectList("virtualWallet", map);
		return lists;
	}
	@Override
	public int getLastBalance() {
		int blc=sqlMap.selectOne("getLastBalance");
		return blc;
	}
	@Override
	public List userInfoFind(Map map) {
		List userinfo=sqlMap.selectList("userInfoFind",map);
		return userinfo;
	}
	
}