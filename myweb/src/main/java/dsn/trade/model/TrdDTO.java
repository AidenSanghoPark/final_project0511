package dsn.trade.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class TrdDTO {

	private int t_idx;
	private int u_idx;
	private int c_idx;
    private int t_pay;
    private int t_type;
    private Date t_date;
	   
	public TrdDTO() {
		super();
	}
	
	public int getT_idx() {
		return t_idx;
	}

	public void setT_idx(int t_idx) {
		this.t_idx = t_idx;
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

	public int getT_pay() {
		return t_pay;
	}

	public void setT_pay(int t_pay) {
		this.t_pay = t_pay;
	}

	public int getT_type() {
		return t_type;
	}

	public void setT_type(int t_type) {
		this.t_type = t_type;
	}

	public Date getT_date() {
		return t_date;
	}

	public void setT_date(Date t_date) {
		this.t_date = t_date;
	}
}
