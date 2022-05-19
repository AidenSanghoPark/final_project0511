package dsn.designer.model;

import java.util.*;

import org.springframework.web.multipart.MultipartFile;

import dsn.member.model.MemberDTO;
import dsn.profile.model.ProfileDTO;

public interface DesignerService {
	public List portfolio(int cp, int listSize, int u_idx);
	public List review(int cp, int listSize, int u_idx);
	public int designerWin(int u_idx);
	public ProfileDTO profileInfo(int u_idx);
	public MemberDTO userInfo(int u_idx);
	public int profileInsert(ProfileDTO dto);
	public int profileUpdate(ProfileDTO dto);
	public int portfolioTotalCnt();
	public int reviewTotalCnt();
	public int designerTotalCnt();
	public int designerListTotalCnt();
	public List designerList(int cp, int listSize);
	public DesignerDTO portfolioDetail(int d_idx);
}
