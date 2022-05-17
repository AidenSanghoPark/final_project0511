package dsn.contest.model;

import org.mybatis.spring.SqlSessionTemplate;

public class ConDAOImple implements ConDAO {
	
	private SqlSessionTemplate sqlMap;

	public ConDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	@Override
	public int addLogo(ConDTO dto) {
		int count = sqlMap.insert("addLogo", dto);
		return count;
	}
	@Override
	public int addNaming(ConDTO dto) {
		int count = sqlMap.insert("addNaming", dto);
		return count;
	}
	@Override
	public int addCharacter(ConDTO dto) {
		int count = sqlMap.insert("addCharacter", dto);
		return count;
	}
	@Override
	public int addPrint(ConDTO dto) {
		int count = sqlMap.insert("addPrint", dto);
		return count;
	}
	@Override
	public int addTrade(TradeDTO dto) {
		int count = sqlMap.insert("addTrade", dto);
		return count;
		
	}
}
