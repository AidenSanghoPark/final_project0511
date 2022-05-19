package dsn.reportManage.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class ReportManageDAOImple implements ReportManageDAO {
	
	
	private SqlSessionTemplate sqlMap;
	
	public ReportManageDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap =sqlMap;
	}
	
	@Override
	public List reportList(Map map) {
		List lists = sqlMap.selectList("dsn.adminReport.reportList",map);
		return lists;
	}
	@Override
	public int getTotalCnt() {
		int cnt = sqlMap.selectOne("dsn.adminReport.totalCnt");
		return cnt;
	}
	@Override
	public int reportCheckUpdate(ReportManageDTO dto) {
		return sqlMap.update("dsn.adminReport.reportCheckUpdate", dto);
	}
	@Override
	public ReportManageDTO reportContent(int r_idx) {
		ReportManageDTO dto = sqlMap.selectOne("dsn.adminReport.reportContent", r_idx);
		return dto;
	}
	

}
