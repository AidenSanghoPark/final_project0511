package dsn.contest.model;

import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

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

		
}
