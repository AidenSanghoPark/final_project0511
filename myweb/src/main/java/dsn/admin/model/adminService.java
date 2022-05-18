package dsn.admin.model;

public interface adminService {
	public int loginCheck(String adminId, String adminPwd) throws Exception;
	
	public String getUserInfo(String adminId) throws Exception;
}
