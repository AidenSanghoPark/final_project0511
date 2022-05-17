package dsn.memberManage.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class memberManageDAOImple implements memberManageDAO {
//sqlMap연결
private SqlSessionTemplate sqlMap;
	
	public memberManageDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap =sqlMap;
	}

	public int getTotalCnt() {
		int cnt = sqlMap.selectOne("dsn.admin.totalCnt");
		return cnt;
	}
	public memberManageDTO memberContent(int idx) {
		memberManageDTO dto = sqlMap.selectOne("dsn.admin.memberContent",idx);
		return dto;
	}
	public List memberList(Map map) {

		List lists = sqlMap.selectList("dsn.admin.memberAllList", map);
		return lists;
	}

	public memberManageDTO memberContent(String u_id) {
		memberManageDTO dto = sqlMap.selectOne("dsn.admin.memberContent", u_id);
		return dto;
	}
	@Override
		public int memberBlockUpdate(memberManageDTO dto) {
			return sqlMap.update("dsn.admin.memberBlockUpdate", dto);
		}
	
}
