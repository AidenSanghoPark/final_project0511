package dsn.review.model;

import java.sql.*;

public class ReviewDTO {
	private int rv_idx;
	private int d_idx;
	private int u_idx;
	private String rv_content;
	private Date rv_date;
	
	public ReviewDTO() {
		super();
	}

	public ReviewDTO(int rv_idx, int d_idx, int u_idx, String rv_content, Date rv_date) {
		super();
		this.rv_idx = rv_idx;
		this.d_idx = d_idx;
		this.u_idx = u_idx;
		this.rv_content = rv_content;
		this.rv_date = rv_date;
	}

	public int getRv_idx() {
		return rv_idx;
	}

	public void setRv_idx(int rv_idx) {
		this.rv_idx = rv_idx;
	}

	public int getD_idx() {
		return d_idx;
	}

	public void setD_idx(int d_idx) {
		this.d_idx = d_idx;
	}

	public int getU_idx() {
		return u_idx;
	}

	public void setU_idx(int u_idx) {
		this.u_idx = u_idx;
	}

	public String getRv_content() {
		return rv_content;
	}

	public void setRv_content(String rv_content) {
		this.rv_content = rv_content;
	}

	public Date getRv_date() {
		return rv_date;
	}

	public void setRv_date(Date rv_date) {
		this.rv_date = rv_date;
	}
	
	
	
	

	
}

