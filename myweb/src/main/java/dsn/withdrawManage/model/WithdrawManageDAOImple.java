package dsn.withdrawManage.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import dsn.withdraw.model.WithDrawDTO;


public class WithdrawManageDAOImple implements WithdrawManageDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public WithdrawManageDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap =sqlMap;
	}
	
	@Override
	public int withdrawStatusUpdate(WithDrawDTO dto) {
		
		return sqlMap.update("dsn.adminWithdraw.withdrawStatusUpdate", dto);
	}
	@Override
	public List withdrawList(Map map) {
		List lists = sqlMap.selectList("dsn.adminWithdraw.withdrawList", map);
		return lists;
	}
	@Override
	public int getTotalCnt() {
		int cnt = sqlMap.selectOne("dsn.adminWithdraw.totalCnt");
		return cnt;
	}

	@Override
	public int accountInsert(WithDrawDTO dto) {
		return sqlMap.insert("dsn.adminWithdraw.accountInsert", dto);
	}
	
}
