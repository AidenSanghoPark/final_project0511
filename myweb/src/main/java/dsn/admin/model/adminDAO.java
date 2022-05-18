package dsn.admin.model;

public interface adminDAO {

	
	public int loginCheck(String adminId, String adminPwd) throws Exception ;
	
	public String getUserInfo(String adminId) throws Exception;
}
