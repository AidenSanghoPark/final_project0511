package dsn.contest.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;


public interface ConDAO {

	public List conList(Map map);
	public List cateList(Map map);
	public int dateUp();
	
}
