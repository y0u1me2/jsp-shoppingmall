package com.web.membersecession.model.dao;

import static com.web.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;


public class ModifyPasswordDao {

	private Properties prop=new Properties();
	
	public ModifyPasswordDao() {
		try {
			String path=ModifyPasswordDao.class.getResource("/sql/client/member-query.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	public int Modifypw (Connection conn,String email, String pw) {
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("modifyPassword"); 
		int result = 0; 
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, pw);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
}
