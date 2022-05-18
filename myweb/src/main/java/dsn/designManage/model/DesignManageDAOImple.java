package dsn.designManage.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;


public class DesignManageDAOImple implements DesignManageDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public DesignManageDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap =sqlMap;
	}
	
	@Override
	public int designBlockUpdate(DesignManageDTO dto) {
		
		return sqlMap.update("dsn.adminDesign.designBlockUpdate", dto);
	}
	@Override
	public DesignManageDTO designContent(int d_idx) {
	
		DesignManageDTO dto = sqlMap.selectOne("dsn.adminDesign.designContent", d_idx);
		return dto;
	}
	@Override
	public List designList(Map map) {
		List lists = sqlMap.selectList("dsn.adminDesign.designList", map);
		return lists;
	}
	@Override
	public int getTotalCnt() {
		int cnt = sqlMap.selectOne("dsn.adminDesign.totalCnt");
		return cnt;
	}
	
}
