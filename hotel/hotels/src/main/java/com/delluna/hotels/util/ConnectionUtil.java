package com.delluna.hotels.util;

import java.sql.Connection;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ConnectionUtil {
	private static DataSource ds = new BasicDataSource().ds;
	
	public static Connection getConnection() {
		
		Connection c = null;
		
		try {
			c = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return c;
	}
}


class BasicDataSource{
	DataSource ds = null;
	
	// 초기화시 ds 에 db의 Connection 정보를 넣음
	BasicDataSource(){
		try {
			InitialContext initialContext = new InitialContext();
			ds = (DataSource)initialContext.lookup("java:comp/env/jdbc/mycp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}