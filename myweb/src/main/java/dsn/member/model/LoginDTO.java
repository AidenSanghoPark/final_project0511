 package dsn.member.model;

import java.util.Date;

public class LoginDTO {

	private String u_id;
	private String u_pwd;
	private boolean useCookie;
	private String session_id;
	private Date limit_date;
	private boolean autologin;
	
	public LoginDTO() {
		super();
	}

	public LoginDTO(String u_id, String u_pwd, boolean useCookie, String session_id, Date limit_date,
			boolean autologin) {
		super();
		this.u_id = u_id;
		this.u_pwd = u_pwd;
		this.useCookie = useCookie;
		this.session_id = session_id;
		this.limit_date = limit_date;
		this.autologin = autologin;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_pwd() {
		return u_pwd;
	}

	public void setU_pwd(String u_pwd) {
		this.u_pwd = u_pwd;
	}

	public boolean isUseCookie() {
		return useCookie;
	}

	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}

	public String getSession_id() {
		return session_id;
	}

	public void setSession_id(String session_id) {
		this.session_id = session_id;
	}

	public Date getLimit_date() {
		return limit_date;
	}

	public void setLimit_date(Date limit_date) {
		this.limit_date = limit_date;
	}

	public boolean isAutologin() {
		return autologin;
	}

	public void setAutologin(boolean autologin) {
		this.autologin = autologin;
	}

	

	
	
	
	
}
