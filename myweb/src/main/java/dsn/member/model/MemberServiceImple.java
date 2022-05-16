package dsn.member.model;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImple implements MemberService {

	@Autowired
	private MemberDAO memberDao;
	
	public MemberDAO getMemberDao() {
		return memberDao;
	}

	public void setMemberDao(MemberDAO memberDao) {
		this.memberDao = memberDao;
	}
	//member join
	@Override
	public int memberJoin(MemberDTO dto) {
		
		int count = memberDao.memberJoin(dto);		
		return count;
	}
	//id check
	@Override
	public int idCheck(String userid) {
		
		int result = memberDao.idCheck(userid);
		return result;
	}
	//nick check
	@Override
	public int nickCheck(String usernick) {
		
		int result = memberDao.nickCheck(usernick);
		return result;
	}
	@Override
	public int emailCheck(String useremail) {
		
		int result = memberDao.emailCheck(useremail);
		return result;
	}
	@Override
	public void autoLogin(String session_id, String u_id ,Date limit_date) {
		
		System.out.println(session_id);
		System.out.println(u_id);
		System.out.println(limit_date);
		Map map=new HashMap();
		map.put("session_id",session_id);
		map.put("u_id", u_id);
		map.put("limit_date", limit_date);
		memberDao.autoLogin(map);

	}

	@Override
	public MemberDTO getUser(String u_id) {
		MemberDTO dto=memberDao.getUser(u_id);
		return dto;
	}
	@Override
	public MemberDTO login(LoginDTO ldto) {
		return memberDao.login(ldto);
	}
	
	
	@Override
	public MemberDTO checkUserWithSessionKey(String session_id) {
		System.out.println("service sid="+session_id);
		MemberDTO dto = memberDao.checkUserWithSessionKey(session_id);
		
		System.out.println(dto.getSession_id());
		return dto;
	}


}
