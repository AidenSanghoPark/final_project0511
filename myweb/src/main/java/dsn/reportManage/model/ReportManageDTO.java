package dsn.reportManage.model;

import java.sql.Date;

public class ReportManageDTO {
	
	private int r_idx;
	private String r_content;
	private Date r_date;
	private int u_idx;
	private int c_idx;
	private String r_check;
	private String r_subject;
	private String u_name;
	
	public ReportManageDTO() {
		super();
	}

	public ReportManageDTO(int r_idx, String r_content, Date r_date, int u_idx, int c_idx, String r_check,
			String r_subject, String u_name) {
		super();
		this.r_idx = r_idx;
		this.r_content = r_content;
		this.r_date = r_date;
		this.u_idx = u_idx;
		this.c_idx = c_idx;
		this.r_check = r_check;
		this.r_subject = r_subject;
		this.u_name = u_name;
	}

	public int getR_idx() {
		return r_idx;
	}

	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public Date getR_date() {
		return r_date;
	}

	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}

	public int getU_idx() {
		return u_idx;
	}

	public void setU_idx(int u_idx) {
		this.u_idx = u_idx;
	}

	public int getC_idx() {
		return c_idx;
	}

	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}

	public String getR_check() {
		return r_check;
	}

	public void setR_check(String r_check) {
		this.r_check = r_check;
	}

	public String getR_subject() {
		return r_subject;
	}

	public void setR_subject(String r_subject) {
		this.r_subject = r_subject;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	
	

}
