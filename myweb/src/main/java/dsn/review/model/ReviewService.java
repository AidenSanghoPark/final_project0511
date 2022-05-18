package dsn.review.model;

import java.util.*;

public interface ReviewService {
	
	public List reviewList(int cp, int listSize);
	public int reviewListTotalCnt();
}
