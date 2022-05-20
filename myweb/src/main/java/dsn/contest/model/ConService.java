package dsn.contest.model;

import java.util.List;

import java.util.Map;

import dsn.contest.model.*;
import dsn.trade.model.TrdDTO;


public interface ConService {
	public List conList(int cp, int listSize, String searchType, String keyword);
	public List cateList(int cp, int listSize, String c_cate);
	public List conEnd(int cp, int listSize, String searchType, String keyword);
	public List cateEnd(int cp, int listSize, String c_cate);
	public int dateUp();
	public int ContestCnt();
	public ConDTO conContent(int c_idx);
	public int conCount(int c_readnum, int c_idx);
	public ConDTO conInfo(int c_idx);
	public int contestJoin(DesignerConDTO dto);
	public int addNaming(ConDTO dto);
	public int addNamingTrade(TrdDTO dto);
	public void updateTrd(ConDTO dto);
	public void designerWin(int d_idx);
	public void contestEnd(int c_idx);
	public void payUpdate(int u_idx,String c_subject,int a_account,int uidx,int account);
	public DesignerConDTO contestContent(int d_idx, int c_idx);
	public List conPart(int cp, int listSize, int c_idx);
}
