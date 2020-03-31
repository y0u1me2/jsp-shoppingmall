package com.web.member.model.dao;

import static com.web.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.web.member.model.vo.Member;

public class MemberDao {
	
	private Properties prop=new Properties();

	public MemberDao() {
		try {
			String path=MemberDao.class.getResource("/sql/client/member-query.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public Member loginMember(Connection conn, String email, String pw) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("loginMember");
		Member m=null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,email);
			pstmt.setString(2,pw);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=new Member();
				m.setM_No(rs.getInt("M_NO"));
				m.setM_Email(rs.getString("M_EMAIL"));
				m.setM_Password(rs.getString("M_PASSWORD"));
				m.setM_NickName(rs.getString("M_NICKNAME"));
				m.setM_Address(rs.getString("M_ADDRESS"));
				m.setM_Post(rs.getString("M_POST"));
				m.setM_Phone(rs.getString("M_PHONE"));
				m.setM_Enroll(rs.getDate("M_ENROLL"));
				m.setM_EmailCheck(rs.getString("M_EMAILCHECK"));
				m.setM_Status(rs.getString("M_STATUS"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}
	
	public Member searchEmail(Connection conn, String userName) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("searchEmail");
		Member m=null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,userName);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=new Member();
				m.setM_No(rs.getInt("M_NO"));
				m.setM_Email(rs.getString("M_EMAIL"));
				m.setM_Password(rs.getString("M_PASSWORD"));				
				m.setM_Name(rs.getString("M_NAME"));
				m.setM_NickName(rs.getString("M_NICKNAME"));
				m.setM_EmailCheck(rs.getString("M_EmailCheck"));
				m.setM_Address(rs.getString("M_ADDRESS"));
				m.setM_Post(rs.getString("M_POST"));
				m.setM_Phone(rs.getString("M_PHONE"));
				m.setM_Enroll(rs.getDate("M_ENROLL"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}
	
	/*
	 * public int enrollMember(Connection conn, Member m) { PreparedStatement
	 * pstmt=null; int result=0; String sql=prop.getProperty("enrollMember"); try {
	 * pstmt=conn.prepareStatement(sql); pstmt.setString(1, m.getM_Email());
	 * pstmt.setString(2, m.getM_Password()); pstmt.setString(3, m.getM_Name());
	 * pstmt.setString(4, m.getM_NickName()); pstmt.setString(5, m.getM_Post());
	 * pstmt.setString(6, m.getM_Address()); pstmt.setString(7, m.getM_Phone());
	 * result=pstmt.executeUpdate();
	 * 
	 * }catch(SQLException e) { e.printStackTrace(); }finally { close(pstmt); }
	 * return result; }
	 */
	
	
	//이거 아님요 나중에 지워야함
	public int enrollMember(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("enrollMember");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, m.getM_Email());
			pstmt.setString(2, m.getM_Password());
			pstmt.setString(3, m.getM_NickName());
			pstmt.setString(4, m.getM_Name());
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int setMemberEmailChecked(Connection conn, String email) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("emailCheckAuth");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, email);			
			result=pstmt.executeUpdate();			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	
	public boolean duplicationEmail(Connection conn, String emailCheck) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("duplicationEmail");
		boolean flag=true;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, emailCheck);
			rs=pstmt.executeQuery();
			if(rs.next()) {//조회한거 있을때 false
				flag=false;				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return flag;
	}
	
	public String passwordCheck(Connection conn, String emailCheck) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String passwordCheck="";
		String sql=prop.getProperty("passwordCheck");
		boolean flag=true;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, emailCheck);
			rs=pstmt.executeQuery();
			if(rs.next()) {//조회한거 있을때 false
				passwordCheck=rs.getString("M_PASSWORD");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return passwordCheck;
	}
}
