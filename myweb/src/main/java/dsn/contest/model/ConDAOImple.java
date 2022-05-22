package dsn.contest.model;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import dsn.contest.model.*;
import dsn.designer.model.DesignerDTO;
import dsn.trade.model.TrdDTO;


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
		public int ContestCntEnd() {
			int cnt=sqlMap.selectOne("ContestCntEnd");
			return cnt;
		}


		@Override
		public ConDTO conContent(int c_idx) {
			ConDTO dto=sqlMap.selectOne("conContent", c_idx);
			return dto;
		}
		@Override
		public ConDTO conContent2(int c_idx) {
			ConDTO dto=sqlMap.selectOne("conContent", c_idx);
			return dto;
		}
		@Override
		public int designInfo(Map map) {
		return sqlMap.selectOne("designInfo", map);
		}


		@Override
		public int conCount(Map map) {
			int count=sqlMap.update("conCount",map);
			return count;
		}

		@Override
		public ConDTO conInfo(int c_idx) {
			return sqlMap.selectOne("conInfo",c_idx);
		}
		@Override
		public int joinSum(int c_idx) {
		return sqlMap.selectOne("joinSum", c_idx);
		}
		@Override
		public int contestJoin(DesignerConDTO dto) {
			int cnt=sqlMap.insert("contestJoin", dto);
			return cnt;
		}

		@Override
		public void updateTrd(ConDTO dto) {
			sqlMap.update("updateTrd", dto);
		}
		
		@Override
		public int designerUser(int d_idx) {
		return sqlMap.selectOne("designerUser", d_idx);
		}
		@Override
		public int contestPay(int c_idx) {
		return sqlMap.selectOne("contestPay", c_idx);
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
		@Override
		public void contestEnd(int c_idx) {
			sqlMap.update("contestEnd",c_idx);
		
		}
		@Override
		public void designerWin(int d_idx) {
			sqlMap.update("designerWin", d_idx);
		}
		@Override
		public void payUpdate(Map map) {
			sqlMap.insert("payUpdate",map);
		
		}
		@Override
		public DesignerConDTO contestContent(Map map) {
			DesignerConDTO dto=sqlMap.selectOne("contestContent", map);
			return dto;
		}
		
		@Override
		public List conPart(Map map) {
			List dlists=sqlMap.selectList("conPart", map);
			return dlists;
		}


		@Override
		public DesignerDTO conPartContent(int d_idx) {
			DesignerDTO dto = sqlMap.selectOne("conPartContent", d_idx);
			return dto;
		}

}
