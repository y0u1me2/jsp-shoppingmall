package com.web.common;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {
	
	//DB관련 공통으로 사용하는것들의 기능을 모아놓은 객체
	//Connection생성, 각PreparedStatement, Statement, ResultSet등
	//SQL을 실행하고 결과를 가져오는 객체를 관리하는 기능(닫는 기능)
	//트렌젝션을 처리하는 기능을 모아놓고 관리(commit,rollback)
	//공통 -> 공용 -> static으로 모든메소드 선언!
		
	//Connection생성하기
	public static Connection getConnection() {
		Connection conn = null;
		
		// sql 프로퍼티스 파일 가져오기
		try {
			Properties prop = new Properties();
			
			String path = JDBCTemplate.class.getResource("/sql/driver/driver.properties").getPath();
			
			prop.load(new FileReader(path));
			
			Class.forName(prop.getProperty("driver")); //prop에 key값 불러옴
			
			conn = DriverManager.getConnection(
					prop.getProperty("url"),prop.getProperty("user"),prop.getProperty("pw"));
			conn.setAutoCommit(false);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	//sql에서 사용한 객체 닫는 메소드 구현 (매개변수로 받은 커넥션을 닫아줌)
	public static void close(Connection conn) {
		try {
			if(conn!=null && !conn.isClosed()) {
				conn.close();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	//statement닫아주기 : Statement는 PreparedStatement의 부모객체임
	//Statement를 닫아주는 메소드만 구현해도 다 처리할 수 있음
	public static void close(Statement stmt) {
		try {
			if(stmt !=null && !stmt.isClosed()) {
				stmt.close();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	//ResultSet닫기
	public static void close(ResultSet rs) {
		try {
			if(rs !=null && !rs.isClosed()) {
				rs.close();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	//트렌젝션처리 메소드 만들기
	public static void commit(Connection conn) {
		try {
			if(conn!=null && !conn.isClosed()) {
				conn.commit();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void rollback(Connection conn) {
		try {
			if(conn!=null && !conn.isClosed()) {
				conn.rollback();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	
	
}
