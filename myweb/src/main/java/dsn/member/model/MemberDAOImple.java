package dsn.member.model;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class MemberDAOImple implements MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	public MemberDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int memberJoin(MemberDTO dto) {
		
		int count = sqlMap.insert("memberInsert", dto);
		return count;
	}
	@Override
	public int idCheck(String userid) {

		return sqlMap.selectOne("idCheck", userid);
	}
	@Override
	public int nickCheck(String usernick) {
		
		return sqlMap.selectOne("nickCheck", usernick);
	}
	@Override
	public int emailCheck(String useremail) {
		
		return sqlMap.selectOne("emailCheck", useremail);
	}
	@Override
	public void autoLogin(Map map) {
		sqlMap.update("autoLogin",map);
	}
	@Override
	public MemberDTO getUser(String u_id) {
		MemberDTO dto=sqlMap.selectOne("getUser", u_id);
		return dto;
	}
	@Override
	public MemberDTO login(MemberDTO dto) {
		return sqlMap.selectOne("login",dto);
	}
	@Override
	public MemberDTO checkUserWithSessionKey(String session_id) {
		MemberDTO dto=sqlMap.selectOne("checkUserWithSessionKey",session_id);
		System.out.println("dao="+dto.getU_id());
		return dto;
	}
	
}


