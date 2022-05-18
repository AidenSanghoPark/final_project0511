package dsn.admin.model;

import org.springframework.stereotype.Service;

@Service
public class adminServiceImple implements adminService {
	
	private adminDAO adminDao;
	
	public adminDAO getAdminDao() {
		return adminDao;
	}
	public void setAdminDao(adminDAO adminDao) {
		this.adminDao = adminDao;
	}
	
	public int loginCheck(String adminId, String adminPwd) throws Exception {
		return adminDao.loginCheck(adminId, adminPwd);
	}
	
	public String getUserInfo(String adminId) throws Exception {
		return adminDao.getUserInfo(adminId);
	}	
}
