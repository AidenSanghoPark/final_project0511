package dsn.profile.model;

import org.springframework.web.multipart.MultipartFile;

public class ProfileDTO {

	private int p_idx;
	private int u_idx;
	private String p_img;
	private String p_info;
	private String u_wallet;
	private String u_bank;
	private MultipartFile upload;
	
	
	public ProfileDTO() {
		super();
	}
	
	
	public ProfileDTO(int p_idx, int u_idx, String p_img, String p_info, String u_wallet, String u_bank,
			MultipartFile upload) {
		super();
		this.p_idx = p_idx;
		this.u_idx = u_idx;
		this.p_img = p_img;
		this.p_info = p_info;
		this.u_wallet = u_wallet;
		this.u_bank = u_bank;
		this.upload = upload;
	}
	
	

	public String getU_bank() {
		return u_bank;
	}


	public void setU_bank(String u_bank) {
		this.u_bank = u_bank;
	}


	public MultipartFile getUpload() {
		return upload;
	}


	public int getP_idx() {
		return p_idx;
	}


	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
	}


	public int getU_idx() {
		return u_idx;
	}


	public void setU_idx(int u_idx) {
		this.u_idx = u_idx;
	}


	public String getP_img() {
		return p_img;
	}


	public void setP_img(String p_img) {
		this.p_img = p_img;
	}


	public String getP_info() {
		return p_info;
	}


	public void setP_info(String p_info) {
		this.p_info = p_info;
	}


	public String getU_wallet() {
		return u_wallet;
	}


	public void setU_wallet(String u_wallet) {
		this.u_wallet = u_wallet;
	}


	public String getU_bank() {
		return u_bank;
	}


	public void setU_bank(String u_bank) {
		this.u_bank = u_bank;
	}


	public MultipartFile getUpload() {
		return upload;
	}


	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	
	
	
}
