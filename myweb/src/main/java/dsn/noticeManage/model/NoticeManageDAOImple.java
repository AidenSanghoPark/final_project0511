package dsn.noticeManage.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;


public class NoticeManageDAOImple implements NoticeManageDAO {

	private SqlSessionTemplate sqlMap;
	
	public NoticeManageDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap =sqlMap;
	}
	
	@Override
	public int getTotalCnt() {
		int cnt = sqlMap.selectOne("dsn.adminNotice.totalCnt");
		return cnt;
	}
	
	@Override
	public NoticeManageDTO noticeContent(int n_idx) {
		NoticeManageDTO dto = sqlMap.selectOne("dsn.adminNotice.noticeContent", n_idx);
		return dto;
	}
	
	@Override
	public List noticeList(Map map) {
		List lists = sqlMap.selectList("dsn.adminNotice.noticeAllList", map);
		return lists;
	}
	
	@Override
	public int noticeDel(int n_int) {
		int count  = sqlMap.delete("dsn.adminNotice.noticeDelete", n_int);
		return count;
	}
	@Override
	public NoticeManageDTO noticeUpdateForm(int n_idx) {
		return sqlMap.selectOne("dsn.adminNotice.noticeUpdateForm", n_idx);
	}
	@Override
	public int noticeUpdate(NoticeManageDTO dto) {
		int count = sqlMap.update("dsn.adminNotice.noticeUpdate", dto);
		return count;
	}
	@Override
	public int noticeWrite(NoticeManageDTO dto) {
		int count = sqlMap.insert("dsn.adminNotice.noticeWrite", dto);
		return count;
	}
	
}
