package dsn.contest.model;

import java.util.List;



import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import dsn.contest.model.*;
import dsn.trade.model.TrdDTO;

public interface ConDAO {

	public List conList(Map map);
	public List cateList(Map map);
	public List conEnd(Map map);
	public List cateEnd(Map map);
	public int dateUp();
	public int ContestCnt();
	public ConDTO conContent(int c_idx);
	public int conCount(Map map);
	public int contestJoin(DesignerDTO dto);
	public void designerWin(int d_idx);
	public void contestEnd(int c_idx);
	public void payUpdate(Map map);
	public ConDTO conInfo(int c_idx);
	public void updateTrd(ConDTO dto);
	
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
	
	
	public void designerWin(int d_idx);
	public void contestEnd(int c_idx);
	public void payUpdate(Map map);
}
