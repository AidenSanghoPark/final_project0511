package dsn.noticeManage.model;

import java.sql.Date;

public class NoticeManageDTO {

	private int n_idx;
	private String n_subject;
	private String n_content;
	private Date n_date;
	
	public NoticeManageDTO() {
		super();
	}

	public NoticeManageDTO(int n_idx, String n_subject, String n_content, Date n_date) {
		super();
		this.n_idx = n_idx;
		this.n_subject = n_subject;
		this.n_content = n_content;
		this.n_date = n_date;
	}

	public int getN_idx() {
		return n_idx;
	}

	public void setN_idx(int n_idx) {
		this.n_idx = n_idx;
	}

	public String getN_subject() {
		return n_subject;
	}

	public void setN_subject(String n_subject) {
		this.n_subject = n_subject;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public Date getN_date() {
		return n_date;
	}

	public void setN_date(Date n_date) {
		this.n_date = n_date;
	}
	
	

	
}
