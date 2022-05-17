package dsn.withdraw.model;

import java.sql.Date;

public class WithDrawDTO {

	private int w_idx;
	private int u_idx;
	private String w_bank;
	private String w_name;
	private String w_number;
	private String w_price;
	private Date w_date;
	
	public WithDrawDTO() {
		super();
	}
	
	public WithDrawDTO(int w_idx, int u_idx, String w_bank, String w_name, String w_number, String w_price,
			Date w_date) {
		super();
		this.w_idx = w_idx;
		this.u_idx = u_idx;
		this.w_bank = w_bank;
		this.w_name = w_name;
		this.w_number = w_number;
		this.w_price = w_price;
		this.w_date = w_date;
	}
	
	public int getW_idx() {
		return w_idx;
	}
	public void setW_idx(int w_idx) {
		this.w_idx = w_idx;
	}
	public int getU_idx() {
		return u_idx;
	}
	public void setU_idx(int u_idx) {
		this.u_idx = u_idx;
	}
	public String getW_bank() {
		return w_bank;
	}
	public void setW_bank(String w_bank) {
		this.w_bank = w_bank;
	}
	public String getW_name() {
		return w_name;
	}
	public void setW_name(String w_name) {
		this.w_name = w_name;
	}
	public String getW_number() {
		return w_number;
	}
	public void setW_number(String w_number) {
		this.w_number = w_number;
	}
	public String getW_price() {
		return w_price;
	}
	public void setW_price(String w_price) {
		this.w_price = w_price;
	}
	public Date getW_date() {
		return w_date;
	}
	public void setW_date(Date w_date) {
		this.w_date = w_date;
	}
	
	
}
