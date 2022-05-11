package dsn.virtualwallet.model;

import java.sql.Date;

public class WalletDTO {

	private int u_idx;
	private String a_type;
	private Date a_date;
	private String c_subject;
	private String a_content;
	private int a_amount;
	private int a_balance;
	
	public WalletDTO() {
		super();
	}

	public WalletDTO(int u_idx, String a_type, Date a_date, String c_subject, String a_content, int a_amount,
			int a_balance) {
		super();
		this.u_idx = u_idx;
		this.a_type = a_type;
		this.a_date = a_date;
		this.c_subject = c_subject;
		this.a_content = a_content;
		this.a_amount = a_amount;
		this.a_balance = a_balance;
	}

	public int getU_idx() {
		return u_idx;
	}

	public void setU_idx(int u_idx) {
		this.u_idx = u_idx;
	}

	public String getA_type() {
		return a_type;
	}

	public void setA_type(String a_type) {
		this.a_type = a_type;
	}

	public Date getA_date() {
		return a_date;
	}

	public void setA_date(Date a_date) {
		this.a_date = a_date;
	}

	public String getC_subject() {
		return c_subject;
	}

	public void setC_subject(String c_subject) {
		this.c_subject = c_subject;
	}

	public String getA_content() {
		return a_content;
	}

	public void setA_content(String a_content) {
		this.a_content = a_content;
	}

	public int getA_amount() {
		return a_amount;
	}

	public void setA_amount(int a_amount) {
		this.a_amount = a_amount;
	}

	public int getA_balance() {
		return a_balance;
	}

	public void setA_balance(int a_balance) {
		this.a_balance = a_balance;
	}
}
