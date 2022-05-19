package dsn.review.model;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;

public class ReviewServiceImple implements ReviewService {
	
	private ReviewDAO reviewDao;

	public ReviewDAO getReviewDao() {
		return reviewDao;
	}

	public void setReviewDao(ReviewDAO reviewDao) {
		this.reviewDao = reviewDao;
	}
	
	@Override
	public List reviewList(int cp, int listSize) {
		int start=((cp-1)*listSize)+1;
		int end=cp*listSize;
		Map map=new HashedMap();
		map.put("start", start);
		map.put("end", end);
		
		List lists=reviewDao.reviewList(map);
		return lists;
	}
	
	@Override
	public int reviewListTotalCnt() {
		int cnt=reviewDao.reviewListTotalCnt();
		cnt=cnt==0?1:cnt;
		return cnt;
	}
}
