package dsn.contest.model;

import java.util.List;
import java.util.Map;


public interface ConService {
	public List conList(int cp, int listSize);
	public List cateList(int cp, int listSize, String c_cate);
	public int dateUp();
}