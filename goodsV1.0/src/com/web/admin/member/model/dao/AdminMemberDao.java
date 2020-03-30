package com.web.admin.member.model.dao;


import static com.web.common.JDBCTemplate.close;


import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import com.web.member.model.vo.Member;
public class AdminMemberDao {
	
	Properties prop=new Properties();
	
	public AdminMemberDao() {
		try {
			String path=AdminMemberDao.class.getResource("/sql/admin/admin-query.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Member> searchMember(Connection conn, int cPage, int numPerPage){
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		String sql=prop.getProperty("searchPageMember");
		List<Member> list = new ArrayList();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1); //시작데이터 번호 rum기준
			
			//cPage=1 => 시작 : 1
			//cPage=2 => 시작 : 11
			//cPage=3 => 시작 : 21
			pstmt.setInt(2, cPage*numPerPage); //끝 데이터 번호 rum기준
			//cPage=1 => 끝 : 10
			//cPage=2 => 시작 : 20
			//cPage=3 => 시작 : 30
			rs=pstmt.executeQuery();
			while(rs.next()) {
	            Member m=new Member();
	            m.setM_Enroll(rs.getDate("m_enroll"));
	            m.setM_No(rs.getInt("m_no"));
	            m.setM_Name(rs.getString("m_name"));
	            m.setM_NickName(rs.getString("m_nickname"));	  
	            m.setM_Phone(rs.getString("m_phone"));
	            m.setM_Post(rs.getString("m_post"));
	            m.setM_Address(rs.getString("m_address"));
	            m.setM_Email(rs.getString("m_email"));
	            list.add(m);//빼먹으면 데이터 안나옴.
	         }

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
	         close(rs);
	         close(pstmt);
	      }
	      return list;
		
	}
	
	public int memberCount(Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rs=null;
		String sql=prop.getProperty("memberCount");
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally { 
			   close(rs);
		       close(pstmt);
		}
		return result;
	}
	
	public List<Member> searchMemberPage(Connection conn, int cPage, int numPerPage,String type,String keyword){
		Statement stmt=null;
		ResultSet rs = null;
		String sql="SELECT * FROM (SELECT ROWNUM AS RNUM,A.* FROM(SELECT * FROM MEMBER WHERE "+type+" like '%"+keyword
				+"%' AND M_STATUS='Y' order by M_NO DESC)A) WHERE RNUM BETWEEN "+((cPage-1)*numPerPage+1)+" and "+(cPage*numPerPage);
		List<Member> list=new ArrayList();
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				 Member m=new Member();
		            m.setM_Enroll(rs.getDate("m_enroll"));
		            m.setM_No(rs.getInt("m_no"));
		            m.setM_Name(rs.getString("m_name"));
		            m.setM_NickName(rs.getString("m_nickname"));	  
		            m.setM_Phone(rs.getString("m_phone"));
		            m.setM_Post(rs.getString("m_post"));
		            m.setM_Address(rs.getString("m_address"));
		            m.setM_Email(rs.getString("m_email"));
		            list.add(m);//빼먹으면 데이터 안나옴.
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		System.out.println("다오"+list.size());
		return list;
	}
	
	public int memberCount(Connection conn,String type,String keyword) {
		Statement stmt=null;
		ResultSet rs = null;
		int result = 0;
		String sql="SELECT COUNT(*) as cnt FROM MEMBER WHERE "+type+" LIKE '%"+keyword+"%' AND M_STATUS='Y'";
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			if(rs.next()) result=rs.getInt("cnt");
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return result;
		
	}
	
	public int memberDelete(Connection conn, String deleteEmail) {
		   PreparedStatement pstmt=null;
		   int result = 0;
		   String sql=prop.getProperty("memberDelete");
		   try {
			   pstmt=conn.prepareStatement(sql);
			   pstmt.setString(1, "N");
			   pstmt.setString(2, deleteEmail);
			   result=pstmt.executeUpdate();
		   }catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			return result;
	   }
	
	public int memberCkDelete(Connection conn, String[] memCkDelete) {
		   PreparedStatement pstmt=null;
		   int result = 0;
		   String sql=prop.getProperty("memberDelete");
		   for(int i=0;i<memCkDelete.length;i++) {
			   System.out.println(memCkDelete[i]);
		   }
		   try {
			   pstmt=conn.prepareStatement(sql);
			   for(int i=0;i<memCkDelete.length;i++) {
				   pstmt.setString(1, "N");
				   pstmt.setString(2, memCkDelete[i]);
				   result=pstmt.executeUpdate();
			   }
		   }catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			return result;
	   }
	
	public int memberDeleteCount(Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rs=null;
		String sql=prop.getProperty("memberDeleteCount");
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally { 
			   close(rs);
		       close(pstmt);
		}
		return result;
	}
	
	public int memberTodayEnrollCount(Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rs=null;
		String sql=prop.getProperty("memberTodayEnrollCount");
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally { 
			   close(rs);
		       close(pstmt);
		}
		return result;
	}
	
	public List<Member> memberNew(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		String sql=prop.getProperty("memberNew");
		List<Member> list = new ArrayList();
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
	            Member m=new Member();
	            m.setM_Enroll(rs.getDate("m_enroll"));
	            m.setM_No(rs.getInt("m_no"));
	            m.setM_Name(rs.getString("m_name"));
	            m.setM_NickName(rs.getString("m_nickname"));	  
	            m.setM_Phone(rs.getString("m_phone"));
	            m.setM_Post(rs.getString("m_post"));
	            m.setM_Address(rs.getString("m_address"));
	            m.setM_Email(rs.getString("m_email"));
	            list.add(m);//빼먹으면 데이터 안나옴.
	         }

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
	         close(rs);
	         close(pstmt);
	      }
	      return list;
		
	}
}
