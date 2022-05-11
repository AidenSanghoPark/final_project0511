package dsn.db;

import java.sql.*;
import javax.naming.*;
import javax.sql.*;

public class DsnDB {
	
	static DataSource ds;
	
	static {//static 블록
		try {
		Context initContext = new InitialContext();
		Context envContext  = (Context)initContext.lookup("java:/comp/env");
		ds = (DataSource)envContext.lookup("jdbc/myoracle");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public static Connection getConn() throws Exception {
		
		return ds.getConnection();
	}
}