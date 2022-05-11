package dsn.member.model;

import java.util.*;

public interface MemberService {

	public int memberJoin(MemberDTO dto);

	public int idCheck(String userid);

	public int nickCheck(String usernick);
	
	public int emailCheck(String useremail);
	
	public void autoLogin(String session_id,Date limit_date,String u_id);
	
	public MemberDTO getUser(String u_id);
	
	public MemberDTO login(MemberDTO dto);
	
	public MemberDTO checkUserWithSessionKey(String session_id);
}