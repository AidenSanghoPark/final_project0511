package dsn.index.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class IndexDAOImple implements IndexDAO{
	
	@Autowired
	private SqlSessionTemplate sqlMap;

	public IndexDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	@Override
	public int indexDesigner() {
		return sqlMap.selectOne("indexDesigner");
	}
	@Override
	public int indexContestIng() {
		return sqlMap.selectOne("indexContestIng");
	}
	@Override
	public int indexContestEnd() {
		return sqlMap.selectOne("indexContestEnd");
	}
	@Override
	public int indexContestSum() {
		return sqlMap.selectOne("indexContestSum");
	}
}
