package dsn.designer.model;

public class ListDTO {
	private int rnum;
	private String p_img;
	private String p_info;
	private String u_nick;
	private String u_email;
	private int u_idx;
	
	
	public ListDTO() {
		super();
	}


	public ListDTO(int rnum, String p_img, String p_info, String u_nick, String u_email, int u_idx) {
		super();
		this.rnum = rnum;
		this.p_img = p_img;
		this.p_info = p_info;
		this.u_nick = u_nick;
		this.u_email = u_email;
		this.u_idx = u_idx;
	}


	public int getRnum() {
		return rnum;
	}


	public void setRnum(int rnum) {
		this.rnum = rnum;
	}


	public String getP_img() {
		return p_img;
	}


	public void setP_img(String p_img) {
		this.p_img = p_img;
	}


	public String getP_info() {
		return p_info;
	}


	public void setP_info(String p_info) {
		this.p_info = p_info;
	}


	public String getU_nick() {
		return u_nick;
	}


	public void setU_nick(String u_nick) {
		this.u_nick = u_nick;
	}


	public String getU_email() {
		return u_email;
	}


	public void setU_email(String u_email) {
		this.u_email = u_email;
	}


	public int getU_idx() {
		return u_idx;
	}


	public void setU_idx(int u_idx) {
		this.u_idx = u_idx;
	}
	
	
}
