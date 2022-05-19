package dsn.contest.model;

import java.util.List;


import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

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
	public int addNaming(ConDTO dto);
	public ConDTO conInfo(int c_idx);
	public int contestJoin(DesingerDTO dto);
	public int addNamingTrade(TrdDTO dto);
	public void updateTrd(ConDTO dto);
}
