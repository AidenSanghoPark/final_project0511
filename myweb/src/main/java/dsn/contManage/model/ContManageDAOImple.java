package dsn.contManage.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;




public class ContManageDAOImple implements ContManageDAO {

	private SqlSessionTemplate sqlMap;
	
	public ContManageDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap =sqlMap;
	}
	
	@Override
	public int getTotalCnt() {
		int cnt = sqlMap.selectOne("dsn.adminCont.totalCnt");
		return cnt;
	}
	
	@Override
	public List contList(Map map) {
		List lists = sqlMap.selectList("dsn.adminCont.contAllList", map);
		return lists;
	}
	
	@Override
	public ContManageDTO contContent(int c_idx) {
		ContManageDTO dto = sqlMap.selectOne("dsn.adminCont.contContent", c_idx);
		return dto;
	}

	@Override
	public int contBlockUpdate(ContManageDTO dto) {
		return sqlMap.update("dsn.adminCont.contBlockUpdate", dto);
	}
}
