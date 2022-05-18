package dsn.askManage.model;

import java.sql.Date;

public class AskManageDTO {
	

	private int q_idx;
	private String q_subject;
	private int u_idx;
	private String q_content;
	private Date q_date;
	private String u_email;
	private String u_name;
	private String q_check;
	
	public AskManageDTO() {
		super();
	}

	public AskManageDTO(int q_idx, String q_subject, int u_idx, String q_content, Date q_date, String u_email,
			String u_name, String q_check) {
		super();
		this.q_idx = q_idx;
		this.q_subject = q_subject;
		this.u_idx = u_idx;
		this.q_content = q_content;
		this.q_date = q_date;
		this.u_email = u_email;
		this.u_name = u_name;
		this.q_check = q_check;
	}

	public int getQ_idx() {
		return q_idx;
	}

	public void setQ_idx(int q_idx) {
		this.q_idx = q_idx;
	}

	public String getQ_subject() {
		return q_subject;
	}

	public void setQ_subject(String q_subject) {
		this.q_subject = q_subject;
	}

	public int getU_idx() {
		return u_idx;
	}

	public void setU_idx(int u_idx) {
		this.u_idx = u_idx;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public Date getQ_date() {
		return q_date;
	}

	public void setQ_date(Date q_date) {
		this.q_date = q_date;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getQ_check() {
		return q_check;
	}

	public void setQ_check(String q_check) {
		this.q_check = q_check;
	}
	
	
	
	
	
}
