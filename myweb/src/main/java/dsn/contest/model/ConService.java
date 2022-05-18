package dsn.contest.model;

import java.util.List;
import java.util.Map;


public interface ConService {
	public List conList(int cp, int listSize, String searchType, String keyword);
	public List cateList(int cp, int listSize, String c_cate);
	public List conEnd(int cp, int listSize, String searchType, String keyword);
	public List cateEnd(int cp, int listSize, String c_cate);
	public int dateUp();
	public int ContestCnt();
	public ConDTO conContent(int c_idx);
	public int conCount(int c_readnum, int c_idx);
}