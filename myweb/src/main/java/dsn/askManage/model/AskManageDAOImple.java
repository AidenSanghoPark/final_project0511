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
	
	@Override
	public int askDel(int q_int) {
		int count = sqlMap.delete("dsn.adminAsk.askDelete", q_int);
		return count;
	}
	
	@Override
	public int askUpdate(AskManageDTO dto) {
		int count = sqlMap.update("dsn.adminAsk.askUpdate", dto);
		return count;
	}
	
	@Override
	public AskManageDTO askUpdateForm(int q_int) {
		
		return sqlMap.selectOne("dsn.adminAsk.askUpdateForm", q_int);
	}
	
	@Override
	public int askWrite(AskManageDTO dto) {
		int count = sqlMap.insert("dsn.adminAsk.askWrite", dto);
		return count;
	}
	
	@Override
	public List askUserList(Map map) {
		List lists = sqlMap.selectList("dsn.adminAsk.askUserList", map);
		return lists;
	}
	
	@Override
	public int getUserTotalCnt(int u_idx) {
		int cnt = sqlMap.selectOne("dsn.adminAsk.userTotalCnt", u_idx);
		return cnt;
	}
	
	

	
}
