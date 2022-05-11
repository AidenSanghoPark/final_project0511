package dsn.member.model;

import java.util.Date;
import java.util.Map;

public interface MemberDAO {

	public int memberJoin(MemberDTO dto);

	public int idCheck(String userid);
	
	public int nickCheck(String usernick);
	
	public int emailCheck(String useremail);
	
	public void autoLogin(Map map);
	
	public MemberDTO getUser(String u_id);
	
	public MemberDTO login(MemberDTO dto);
	
	public MemberDTO checkUserWithSessionKey(String session_id);
	
}
