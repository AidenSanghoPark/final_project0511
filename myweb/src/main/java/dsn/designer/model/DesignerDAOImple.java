package dsn.designer.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import dsn.member.model.MemberDTO;
import dsn.profile.model.ProfileDTO;


public class DesignerDAOImple implements DesignerDAO {

	private SqlSessionTemplate sqlMap;
	
	public DesignerDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	@Override
	public List portfolio(Map map) {
		List lists=sqlMap.selectList("portfolio", map);
		return lists;
	}
	
	@Override
	public List review(Map map) {
		List lists=sqlMap.selectList("review", map);
		return lists;
	}
	
	@Override
	public int profileInsert(ProfileDTO dto) {
		int cnt=sqlMap.insert("profileInsert", dto);
		return cnt;
	}
	
	@Override
	public int profileUpdate(ProfileDTO dto) {
		int cnt=sqlMap.update("profileUpdate", dto);
		return cnt;
	}

	@Override
	public int portfolioTotalCnt() {
		int cnt=sqlMap.selectOne("portfolioTotalCnt");
		return cnt;
	}
	
	@Override
	public int reviewTotalCnt() {
		int cnt=sqlMap.selectOne("reviewTotalCnt");
		return cnt;
	}
	
	@Override
	public int designerTotalCnt() {
		int cnt=sqlMap.selectOne("designerTotalCnt");
		return cnt;
	}
	
	@Override
	public int designerWin(int u_idx) {
		int cnt=sqlMap.selectOne("designerWin", u_idx);
		return cnt;
	}
	
	@Override
	public ProfileDTO profileInfo(int u_idx) {
		ProfileDTO dto=sqlMap.selectOne("profileInfo", u_idx);
		return dto;
	}
	
	@Override
	public MemberDTO userInfo(int u_idx) {
		MemberDTO dto=sqlMap.selectOne("userInfo", u_idx);
		return dto;
	}
	
	@Override
	public List designerList(Map map) {
		List lists=sqlMap.selectList("designerList", map);
		return lists;
	}
	
	@Override
	public int designerListTotalCnt() {
		int cnt=sqlMap.selectOne("designerListTotalCnt");
		return cnt;
	}

}
