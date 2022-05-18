package dsn.askManage.model;

import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;


public class AskManageDAOImple implements AskManageDAO {
	
	private SqlSessionTemplate sqlMap;
	private Object subject;
	
	public AskManageDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap =sqlMap;
	}
	
	@Override
	public List askList(Map map) {
		List lists = sqlMap.selectList("dsn.adminAsk.askAllList", map);
		return lists;
	}
	
	@Override
	public int getTotalCnt() {
		int cnt = sqlMap.selectOne("dsn.adminAsk.totalCnt");
		return cnt;
	}
	
	@Override
	public AskManageDTO askContent(int q_idx) {
		AskManageDTO dto = sqlMap.selectOne("dsn.adminAsk.askContent", q_idx);
		return dto;
	}
	
	@Override
	public int askCheckUpdate(AskManageDTO dto) {
		return sqlMap.update("dsn.adminAsk.askCheckUpdate", dto);
	}

}
