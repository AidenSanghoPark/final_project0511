package dsn.contest.model;

import org.mybatis.spring.SqlSessionTemplate;

public class ConDAOImple implements ConDAO {
	
	private SqlSessionTemplate sqlMap;

	public ConDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	@Override
	public int addNaming(ConDTO dto) {
		int count = sqlMap.insert("addNaming", dto);
		return count;
	}
}
