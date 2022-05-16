package dsn.mypage.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import dsn.member.model.MemberDTO;

public class MyPageDAOImple implements MyPageDAO {

	private SqlSessionTemplate sqlMap;
	
	public MyPageDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap=sqlMap;
	}
	
	@Override
	public int userUpdate(MemberDTO dto) {
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
	public int getLastBalance(int u_idx) {
		int blc=sqlMap.selectOne("getLastBalance", u_idx);
		return blc;
	}
	@Override
	public List userInfoFind(Map map) {
		List userinfo=sqlMap.selectList("userInfoFind",map);
		return userinfo;
	}
	@Override
	public String pwdFind(int u_idx) {
		String getlastpwd=sqlMap.selectOne("getLastPWD", u_idx);
		return getlastpwd;
	}
	
}