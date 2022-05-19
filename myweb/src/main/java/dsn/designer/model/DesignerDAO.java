package dsn.designer.model;

import java.util.*;

import dsn.member.model.MemberDTO;
import dsn.profile.model.ProfileDTO;

public interface DesignerDAO {
	
	public List portfolio(Map map);
	public List review(Map map);
	public int designerWin(int u_idx);
	public ProfileDTO profileInfo(int u_idx);
	public MemberDTO userInfo(int u_idx);
	public int profileInsert(ProfileDTO dto);
	public int profileUpdate(ProfileDTO dto);
	public int portfolioTotalCnt();
	public int reviewTotalCnt();
	public int designerTotalCnt();
	public int designerListTotalCnt();
	public List designerList(Map map);
	public DesignerDTO portfolioDetail(int d_idx);
	public List designPhotos(Map map);
	public List designerAllList();
	public int getDesignerCnt(int u_idx);
}
