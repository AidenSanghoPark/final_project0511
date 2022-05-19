package dsn.review.model;

import java.util.*;

public interface ReviewDAO {
	
	public List reviewList(Map map);
	public int reviewListTotalCnt();
}
