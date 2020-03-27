package com.web.profile.model.dao;

import static com.web.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.web.member.model.vo.Member;

public class ProfileDao {

	 private Properties prop=new Properties(); 
	
	public ProfileDao() {
		try {
			String path=ProfileDao.class.getResource("/sql/client/member-query.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	public int pwCheck(Connection conn,String email,String pw) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("memberModify");
		int result = 0; //비밀번호가 맞으면 count(*)이 1, 틀리면 0
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, pw);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);//쿼리문 결과값 0 또는 1
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
}
