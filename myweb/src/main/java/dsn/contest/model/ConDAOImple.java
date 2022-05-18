package dsn.contest.model;

import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import dsn.trade.model.TrdDTO;

public class ConDAOImple implements ConDAO{

		@Autowired
		private SqlSessionTemplate sqlMap;
		
		public ConDAOImple(SqlSessionTemplate sqlMap) {
			super();
			this.sqlMap = sqlMap;
		}
		@Override
		public ConDTO conInfo(int c_idx) {
			return sqlMap.selectOne("conInfo",c_idx);
		}
		@Override
		public int contestJoin(DesingerDTO dto) {
			int cnt=sqlMap.insert("contestJoin", dto);
			return cnt;
		}

		@Override
		public int addNaming(ConDTO dto) {
			int count = sqlMap.insert("addNaming", dto);
			return count;
		}
		@Override
		public int addNamingTrade(TrdDTO dto) {
			int count = sqlMap.insert("addNamingTrade", dto);
			return count;
		}
		@Override
		public void updateTrd(ConDTO dto) {
			sqlMap.update("updateTrd", dto);
		}
}
