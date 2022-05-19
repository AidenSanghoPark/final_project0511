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
		public void updateTrd(ConDTO dto) {
			sqlMap.update("updateTrd", dto);
		}
		
		//logo
		@Override
		public int addLogo(ConDTO dto) {
			
			int count = sqlMap.insert("addLogo", dto);
			return count;
		}
		@Override
		public int addLogoTrade(TrdDTO dto) {
			
			int count = sqlMap.insert("addLogoTrade", dto);
			return count;
		}
				
		//naming
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
		//char
		@Override
		public int addChar(ConDTO dto) {
			
			int count = sqlMap.insert("addChar", dto);
			return count;
		}
		@Override
		public int addCharTrade(TrdDTO dto) {
			
			int count = sqlMap.insert("addCharTrade", dto);
			return count;
		}
		//print
		@Override
		public int addPrint(ConDTO dto) {
			int count = sqlMap.insert("addPrint", dto);
			return count;
		}
		@Override
		public int addPrintTrade(TrdDTO dto) {
			int count = sqlMap.insert("addPrintTrade", dto);
			return count;
		}
}
