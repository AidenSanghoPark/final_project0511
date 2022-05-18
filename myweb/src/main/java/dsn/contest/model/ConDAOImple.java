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
		public List cateEnd(Map map) {
			List lists=sqlMap.selectList("cateEnd", map);
			return lists;
		}


		@Override
		public List conEnd(Map map) {
			List lists=sqlMap.selectList("conEnd", map);
			return lists;
		}

		@Override
		public int dateUp() {
			int dateUp=sqlMap.update("dateUp");
			return dateUp;
		}

		@Override
		public int ContestCnt() {
			int cnt=sqlMap.selectOne("ContestCnt");
			return cnt;
		}


		@Override
		public ConDTO conContent(int c_idx) {
			ConDTO dto=sqlMap.selectOne("conContent", c_idx);
			return dto;
		}


		@Override
		public int conCount(Map map) {
			int count=sqlMap.update("conCount",map);
			return count;
		}

		
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
