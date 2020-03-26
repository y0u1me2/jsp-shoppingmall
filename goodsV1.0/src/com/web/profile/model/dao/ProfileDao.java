package com.web.profile.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.sun.xml.internal.stream.buffer.sax.Properties;
import com.web.member.model.vo.Member;

public class ProfileDao {

	private Properties prop=new Properties();
	
	public ProfileDao() {
		try {
			String path=ProfileDao.class.getResource("/sql/member/member-query.properties").getPath();
			prop.equals(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	public Member loginMember(String email,String pw) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
	//	String sql=prop.("loginMember");
		Member m=null;
		try {
			pstmt.setString(1, email);
			pstmt.setString(2, pw);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=new Member();
				m.setM_Email(rs.getString("M_EMAIL"));
				m.setM_Password(rs.getString("M_PASSWORD"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return m;
	}
}
