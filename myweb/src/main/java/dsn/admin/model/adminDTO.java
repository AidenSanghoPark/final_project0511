package dsn.admin.model;

public class adminDTO  {
	
	private int adIdx;
	private String adId;
	private String adPwd;
	
	public adminDTO() {
		super();
	}

	public adminDTO(int adIdx, String adId, String adPwd) {
		super();
		this.adIdx = adIdx;
		this.adId = adId;
		this.adPwd = adPwd;
	}

	public int getAdIdx() {
		return adIdx;
	}

	public void setAdIdx(int adIdx) {
		this.adIdx = adIdx;
	}

	public String getAdId() {
		return adId;
	}

	public void setAdId(String adId) {
		this.adId = adId;
	}

	public String getAdPwd() {
		return adPwd;
	}

	public void setAdPwd(String adPwd) {
		this.adPwd = adPwd;
	}
	
	

}
