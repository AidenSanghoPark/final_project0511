package dsn.review.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

public class ReviewDAOImple implements ReviewDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public ReviewDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	@Override
	public List reviewList(Map map) {
		List lists=sqlMap.selectList("reviewList", map);
		return lists;
	}
	
	@Override
	public int reviewListTotalCnt() {
		int cnt=sqlMap.selectOne("reviewListTotalCnt");
		return cnt;
	}
}
