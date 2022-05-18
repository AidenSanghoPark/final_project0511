package dsn.contest.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class ConDTO {

	private int c_idx;
	private int t_idx;
	   private String c_subject;
	   private String c_deas;
	   private String c_company;
	   private String c_cate;
	   private String c_logo;
	   private String c_color;
	   private String c_file;
	   private String c_name;
	   private String c_details;
	   private String c_idea;
	   private int c_readnum;
	   private int c_pay;
	   private Date c_opendate;
	   private Date c_enddate;
	   private int u_idx;
	   private int c_datediff;
	   private MultipartFile upload;
	   
	public ConDTO() {
		super();
	}
	public ConDTO(int c_idx, String c_subject, String c_deas, String c_company, String c_cate, String c_logo, String c_color, String c_file, String c_name, String c_details, String c_idea, int c_readnum,
			int c_pay, Date c_opendate, Date c_enddate, int u_idx, int c_datediff, MultipartFile upload) {
		super();
		this.c_idx = c_idx;
		this.c_subject = c_subject;
		this.c_deas = c_deas;
		this.c_company = c_company;
		this.c_cate = c_cate;
		this.c_logo = c_logo;
		this.c_color = c_color;
		this.c_file = c_file;
		this.c_name = c_name;
		this.c_details = c_details;
		this.c_idea = c_idea;
		this.c_readnum = c_readnum;
		this.c_pay = c_pay;
		this.c_opendate = c_opendate;
		this.c_enddate = c_enddate;
		this.u_idx = u_idx;
		this.c_datediff = c_datediff;
		this.upload = upload;
	}
	public int getT_idx() {
		return t_idx;
	}
	public void setT_idx(int t_idx) {
		this.t_idx = t_idx;
	}
	public int getC_idx() {
		return c_idx;
	}
	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}
	public String getC_subject() {
		return c_subject;
	}
	public void setC_subject(String c_subject) {
		this.c_subject = c_subject;
	}
	public String getC_deas() {
		return c_deas;
	}
	public void setC_deas(String c_deas) {
		this.c_deas = c_deas;
	}
	public String getC_company() {
		return c_company;
	}
	public void setC_company(String c_company) {
		this.c_company = c_company;
	}
	public String getC_cate() {
		return c_cate;
	}
	public void setC_cate(String c_cate) {
		this.c_cate = c_cate;
	}
	public String getC_logo() {
		return c_logo;
	}
	public void setC_logo(String c_logo) {
		this.c_logo = c_logo;
	}
	public String getC_color() {
		return c_color;
	}
	public void setC_color(String c_color) {
		this.c_color = c_color;
	}
	public String getC_file() {
		return c_file;
	}
	public void setC_file(String c_file) {
		this.c_file = c_file;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_details() {
		return c_details;
	}
	public void setC_details(String c_details) {
		this.c_details = c_details;
	}
	public String getC_idea() {
		return c_idea;
	}
	public void setC_idea(String c_idea) {
		this.c_idea = c_idea;
	}
	public int getC_readnum() {
		return c_readnum;
	}
	public void setC_readnum(int c_readnum) {
		this.c_readnum = c_readnum;
	}
	public int getC_pay() {
		return c_pay;
	}
	public void setC_pay(int c_pay) {
		this.c_pay = c_pay;
	}
	public Date getC_opendate() {
		return c_opendate;
	}
	public void setC_opendate(Date c_opendate) {
		this.c_opendate = c_opendate;
	}
	public Date getC_enddate() {
		return c_enddate;
	}
	public void setC_enddate(Date c_enddate) {
		this.c_enddate = c_enddate;
	}
	public int getU_idx() {
		return u_idx;
	}
	public void setU_idx(int u_idx) {
		this.u_idx = u_idx;
	}
	public int getC_datediff() {
		return c_datediff;
	}
	public void setC_datediff(int c_datediff) {
		this.c_datediff = c_datediff;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	
	
	
}
package dsn.contest.model;

import java.sql.Date;

public class ConDTO {

	private int c_idx;
	   private String c_subject;
	   private String c_deas;
	   private String c_company;
	   private String c_cate;
	   private String c_logo;
	   private String c_color;
	   private String c_file;
	   private String c_name;
	   private String c_details;
	   private String c_idea;
	   private int c_readnum;
	   private int c_pay;
	   private Date c_opendate;
	   private Date c_enddate;
	   private int u_idx;
	   private int c_datediff;
	   
	public ConDTO() {
		super();
	}

	public ConDTO(int c_idx, String c_subject, String c_deas, String c_company, String c_cate, String c_logo,
			String c_color, String c_file, String c_name, String c_details, String c_idea, int c_readnum, int c_pay,
			Date c_opendate, Date c_enddate, int u_idx, int c_datediff) {
		super();
		this.c_idx = c_idx;
		this.c_subject = c_subject;
		this.c_deas = c_deas;
		this.c_company = c_company;
		this.c_cate = c_cate;
		this.c_logo = c_logo;
		this.c_color = c_color;
		this.c_file = c_file;
		this.c_name = c_name;
		this.c_details = c_details;
		this.c_idea = c_idea;
		this.c_readnum = c_readnum;
		this.c_pay = c_pay;
		this.c_opendate = c_opendate;
		this.c_enddate = c_enddate;
		this.u_idx = u_idx;
		this.c_datediff = c_datediff;
	}

	public int getC_idx() {
		return c_idx;
	}

	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}

	public String getC_subject() {
		return c_subject;
	}

	public void setC_subject(String c_subject) {
		this.c_subject = c_subject;
	}

	public String getC_deas() {
		return c_deas;
	}

	public void setC_deas(String c_deas) {
		this.c_deas = c_deas;
	}

	public String getC_company() {
		return c_company;
	}

	public void setC_company(String c_company) {
		this.c_company = c_company;
	}

	public String getC_cate() {
		return c_cate;
	}

	public void setC_cate(String c_cate) {
		this.c_cate = c_cate;
	}

	public String getC_logo() {
		return c_logo;
	}

	public void setC_logo(String c_logo) {
		this.c_logo = c_logo;
	}

	public String getC_color() {
		return c_color;
	}

	public void setC_color(String c_color) {
		this.c_color = c_color;
	}

	public String getC_file() {
		return c_file;
	}

	public void setC_file(String c_file) {
		this.c_file = c_file;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getC_details() {
		return c_details;
	}

	public void setC_details(String c_details) {
		this.c_details = c_details;
	}

	public String getC_idea() {
		return c_idea;
	}

	public void setC_idea(String c_idea) {
		this.c_idea = c_idea;
	}

	public int getC_readnum() {
		return c_readnum;
	}

	public void setC_readnum(int c_readnum) {
		this.c_readnum = c_readnum;
	}

	public int getC_pay() {
		return c_pay;
	}

	public void setC_pay(int c_pay) {
		this.c_pay = c_pay;
	}

	public Date getC_opendate() {
		return c_opendate;
	}

	public void setC_opendate(Date c_opendate) {
		this.c_opendate = c_opendate;
	}

	public Date getC_enddate() {
		return c_enddate;
	}

	public void setC_enddate(Date c_enddate) {
		this.c_enddate = c_enddate;
	}

	public int getU_idx() {
		return u_idx;
	}

	public void setU_idx(int u_idx) {
		this.u_idx = u_idx;
	}

	public int getC_datediff() {
		return c_datediff;
	}

	public void setC_datediff(int c_datediff) {
		this.c_datediff = c_datediff;
	}

	
}
