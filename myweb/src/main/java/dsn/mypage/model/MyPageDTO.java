package dsn.mypage.model;

import java.sql.Date;

public class MyPageDTO {

	private int u_idx;
	private String u_id;
	private String u_pwd;
	private String u_name;
	private String u_nick;
	private String u_birth;
	private String u_tel;
	private String u_email;
	private String u_wallet;
	private int u_type;
	private Date u_date;
	
	public MyPageDTO() {
		super();
	}

	public MyPageDTO(int u_idx, String u_id, String u_pwd, String u_name, String u_nick, String u_birth, String u_tel,
			String u_email, String u_wallet, int u_type, Date u_date) {
		super();
		this.u_idx = u_idx;
		this.u_id = u_id;
		this.u_pwd = u_pwd;
		this.u_name = u_name;
		this.u_nick = u_nick;
		this.u_birth = u_birth;
		this.u_tel = u_tel;
		this.u_email = u_email;
		this.u_wallet = u_wallet;
		this.u_type = u_type;
		this.u_date = u_date;
	}

	public int getU_idx() {
		return u_idx;
	}

	public void setU_idx(int u_idx) {
		this.u_idx = u_idx;
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

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_nick() {
		return u_nick;
	}

	public void setU_nick(String u_nick) {
		this.u_nick = u_nick;
	}

	public String getU_birth() {
		return u_birth;
	}

	public void setU_birth(String u_birth) {
		this.u_birth = u_birth;
	}

	public String getU_tel() {
		return u_tel;
	}

	public void setU_tel(String u_tel) {
		this.u_tel = u_tel;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getU_wallet() {
		return u_wallet;
	}

	public void setU_wallet(String u_wallet) {
		this.u_wallet = u_wallet;
	}

	public int getU_type() {
		return u_type;
	}

	public void setU_type(int u_type) {
		this.u_type = u_type;
	}

	public Date getU_date() {
		return u_date;
	}

	public void setU_date(Date u_date) {
		this.u_date = u_date;
	}
	
	
}