package dsn.contest.model;

import java.util.List;

import java.util.Map;

import dsn.contest.model.*;
import dsn.designer.model.DesignerDTO;
import dsn.trade.model.TrdDTO;


public interface ConService {
	public List conList(int cp, int listSize, String searchType, String keyword);
	public List cateList(int cp, int listSize, String c_cate);
	public List conEnd(int cp, int listSize, String searchType, String keyword);
	public List cateEnd(int cp, int listSize, String c_cate);
	public int dateUp();
	public int ContestCnt();
	public ConDTO conContent(int c_idx);
	public ConDTO conContent2(int c_idx);
	public int conCount(int c_readnum, int c_idx);
	public List conPart(int cp, int listSize, int c_idx);
	public ConDTO conInfo(int c_idx);
	public int contestJoin(DesignerConDTO dto);
	public void updateTrd(ConDTO dto);
	public void designerWin(int d_idx);
	public void contestEnd(int c_idx);
	public void payUpdate(int u_idx,int a_amount,String c_subject,int uidx,int amount);
	public DesignerConDTO contestContent(int d_idx, int c_idx);
	public int designerUser(int d_idx);
	public int contestPay(int c_idx);
	public int designInfo(int d_idx, int c_idx);
	public int joinSum(int c_idx);
	//logo
	public int addLogo(ConDTO dto);	
	public int addLogoTrade(TrdDTO dto);
	
	//naming	
	public int addNaming(ConDTO dto);
	public int addNamingTrade(TrdDTO dto);
	
	//character
	public int addChar(ConDTO dto);
	public int addCharTrade(TrdDTO dto);
	
	//print
	public int addPrint(ConDTO dto);
	public int addPrintTrade(TrdDTO dto);
	public DesignerDTO conPartContent(int d_idx);

}
