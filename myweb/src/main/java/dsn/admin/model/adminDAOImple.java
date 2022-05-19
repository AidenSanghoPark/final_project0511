package dsn.admin.model;

import org.mybatis.spring.SqlSessionTemplate;

public class adminDAOImple implements adminDAO {
	
	public static final int NOT_ID=1;
	public static int NOT_PWD=2;
	public static int LOGIN_OK=3;
	public static int ERROR=-1;
	
	private SqlSessionTemplate sqlMap;
	
	public adminDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap =sqlMap;
	}
	
	public String getUserInfo(String adminId){
		return sqlMap.selectOne("", adminId);
	}
	
	public int loginCheck(String adminId, String adminPwd){
		
		String adPwd = sqlMap.selectOne("loginCheck", adminId);
		
		if(adPwd == null || "".equals(adPwd)) { // pwd가 조회되지않는다는건 id로 조회한 정보가 없을경우 즉 id가 틀림 NOT_ID = 1을 return
			return NOT_ID;
		}
		
		if(adPwd.equals(adminPwd)) { //adminPwd -> 내가 입력한 pwd ,  adPwd -> id로 조회한 결과의 pwd 글치
			return LOGIN_OK; // 위에 아이디로 조회했는데 가져온애랑 입력한애랑 같으니 LOGIN_OK = 3을 return
		}else{ // id로 조회한애랑 입력한 비밀번호가 달라 비밀번호가 틀려서 NOT_PWD = 2를 return
			return NOT_PWD; //저것처럼 try catch 씌워야대는거임?ㄴㄴ 안씌워도댐 알아서 뻑남 오류ㄴㅏㅁㅕㄴ 다만 아이디 틀렸을 떄꺼만 조금변형하면댈듯
		} /*
			 * else{ return NOT_ID; }
			 */
	}
	
	
}
