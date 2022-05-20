package dsn.designer.model;

import java.sql.*;

public class DesignerDTO {
	
	private int d_idx;
	private int u_idx;
	private int c_idx;
	private String d_name;
	private String d_content;
	private String d_img_1;
	private String d_img_2;
	private Date d_date;
	private int d_win;
	private char d_block;
	private String c_cate;
	
	public DesignerDTO() {
		super();
	}

	public DesignerDTO(int d_idx, int u_idx, int c_idx, String d_name, String d_content, String d_img_1, String d_img_2,
			Date d_date, int d_win, char d_block, String c_cate) {
		super();
		this.d_idx = d_idx;
		this.u_idx = u_idx;
		this.c_idx = c_idx;
		this.d_name = d_name;
		this.d_content = d_content;
		this.d_img_1 = d_img_1;
		this.d_img_2 = d_img_2;
		this.d_date = d_date;
		this.d_win = d_win;
		this.d_block = d_block;
		this.c_cate = c_cate;
	}

	public int getC_idx() {
		return c_idx;
	}

	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
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

	public String getD_name() {
		return d_name;
	}

	public void setD_name(String d_name) {
		this.d_name = d_name;
	}

	public String getD_content() {
		return d_content;
	}

	public void setD_content(String d_content) {
		this.d_content = d_content;
	}

	public String getD_img_1() {
		return d_img_1;
	}

	public void setD_img_1(String d_img_1) {
		this.d_img_1 = d_img_1;
	}

	public String getD_img_2() {
		return d_img_2;
	}

	public void setD_img_2(String d_img_2) {
		this.d_img_2 = d_img_2;
	}

	public Date getD_date() {
		return d_date;
	}

	public void setD_date(Date d_date) {
		this.d_date = d_date;
	}

	public int getD_win() {
		return d_win;
	}

	public void setD_win(int d_win) {
		this.d_win = d_win;
	}

	public char getD_block() {
		return d_block;
	}

	public void setD_block(char d_block) {
		this.d_block = d_block;
	}

	public String getC_cate() {
		return c_cate;
	}

	public void setC_cate(String c_cate) {
		this.c_cate = c_cate;
	}
	
	
	
}
