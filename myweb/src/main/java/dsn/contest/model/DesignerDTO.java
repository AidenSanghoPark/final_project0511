package dsn.contest.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class DesignerDTO {
	
	private int d_idx;
	private int u_idx;
	private String d_name;
	private String d_content;
	private String d_img_1;
	private String d_img_2;
	private Date d_date;
	private int d_win;
	private String d_block;
	private String c_cate;
	private int c_idx;
	private MultipartFile uploadfile1;
	private MultipartFile uploadfile2;
	public DesignerDTO() {
		super();
	}
	public DesignerDTO(int d_idx, int u_idx, String d_name, String d_content, String d_img_1, String d_img_2,
			Date d_date, int d_win, String d_block, String c_cate, int c_idx, MultipartFile uploadfile1,
			MultipartFile uploadfile2) {
		super();
		this.d_idx = d_idx;
		this.u_idx = u_idx;
		this.d_name = d_name;
		this.d_content = d_content;
		this.d_img_1 = d_img_1;
		this.d_img_2 = d_img_2;
		this.d_date = d_date;
		this.d_win = d_win;
		this.d_block = d_block;
		this.c_cate = c_cate;
		this.c_idx = c_idx;
		this.uploadfile1 = uploadfile1;
		this.uploadfile2 = uploadfile2;
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
	public String getD_block() {
		return d_block;
	}
	public void setD_block(String d_block) {
		this.d_block = d_block;
	}
	public String getC_cate() {
		return c_cate;
	}
	public void setC_cate(String c_cate) {
		this.c_cate = c_cate;
	}
	public int getC_idx() {
		return c_idx;
	}
	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}
	public MultipartFile getUploadfile1() {
		return uploadfile1;
	}
	public void setUploadfile1(MultipartFile uploadfile1) {
		this.uploadfile1 = uploadfile1;
	}
	public MultipartFile getUploadfile2() {
		return uploadfile2;
	}
	public void setUploadfile2(MultipartFile uploadfile2) {
		this.uploadfile2 = uploadfile2;
	}
	
	
}
