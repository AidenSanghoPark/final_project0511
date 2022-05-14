package dsn.contest.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;


public class ConDAOImple implements ConDAO{

		private SqlSessionTemplate sqlMap;
		
		public ConDAOImple(SqlSessionTemplate sqlMap) {
			super();
			this.sqlMap = sqlMap;
		}
		

		@Override
		public List cateList(Map map) {
			List lists=sqlMap.selectList("cateList", map);
			return lists;
		}


		@Override
		public List conList(Map map) {
			List lists=sqlMap.selectList("conList", map);
			return lists;
		}


		@Override
		public int dateUp() {
			int dateUp=sqlMap.update("dateUp");
			return dateUp;
		}



		
}
