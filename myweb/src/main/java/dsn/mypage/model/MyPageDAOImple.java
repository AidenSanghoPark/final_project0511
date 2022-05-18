package dsn.mypage.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import dsn.member.model.MemberDTO;
import dsn.review.model.ReviewDTO;
import dsn.trade.model.TradeDTO;
import dsn.withdraw.model.WithDrawDTO;

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
	public int pwdUpdate(Map map) {
		int count=sqlMap.update("pwdUpdate", map);
		return count;
	}
	@Override
	public int getTotalCnt(int u_idx) {
		int cnt=sqlMap.selectOne("dsn.mypage.totalCnt", u_idx);
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
		String u_pwd=sqlMap.selectOne("pwdFind", u_idx);
		return u_pwd;
	}
	@Override
	public int payout(WithDrawDTO dto) {
		int count=sqlMap.insert("payout", dto);
		return count;
	}
	@Override
	public int getWalletCnt(int u_idx) {
		int cnt=sqlMap.selectOne("walletCnt", u_idx);
		return cnt;
	}
	@Override
	public int writeReview(ReviewDTO dto) {
		int count=sqlMap.insert("writeReview");
		return count;
	}
	@Override
	public List showPayInfo(Map map) {
		List lists=sqlMap.selectList("tradeFind", map);
		return lists;
	}
	@Override
	public int getTradeCnt(int u_idx) {
		int cnt =sqlMap.selectOne("getTradeCnt", u_idx);
		return cnt;
	}
}