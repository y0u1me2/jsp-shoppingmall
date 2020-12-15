package com.web.notice.model.dao;

import static com.web.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.web.notice.model.vo.Notice;
import com.web.notice.model.vo.NoticeComment;

public class NoticeDao {
	
	private Properties prop=new Properties();
	
	public NoticeDao() {
		try {
			String path=NoticeDao.class.getResource("/sql/client/notice.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Notice> selectNotice(Connection conn,int cPage,int numPerPage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectNotice");
		List<Notice> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Notice n=new Notice();
				n.setnNo(rs.getInt("n_no"));
				n.setnWriter(rs.getString("n_writer"));
				n.setnTitle(rs.getString("n_title"));
				n.setnContent(rs.getString("n_content"));
				n.setnOriginalFile(rs.getString("n_original_file"));
				n.setnRenamedFile(rs.getString("n_renamed_file"));
				n.setnDate(rs.getDate("n_date"));
				n.setnReadcount(rs.getInt("n_readcount"));
				n.setnStatus(rs.getString("n_status"));
				list.add(n);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public List<Notice> searchNoticePage(Connection conn,int cPage,
			int numPerPage,String type,String keyword){
		Statement stmt=null;
		ResultSet rs=null;
		String sql="SELECT * FROM (SELECT ROWNUM AS RNUM,A.* FROM(SELECT * FROM NOTICE WHERE "+type+" like '%"+keyword
				+"%' AND N_STATUS='Y' order by N_DATE DESC)A) WHERE RNUM BETWEEN "+((cPage-1)*numPerPage+1)+" and "+(cPage*numPerPage);
		List<Notice> list=new ArrayList();
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				Notice n=new Notice();
				n.setnNo(rs.getInt("n_no"));
				n.setnWriter(rs.getString("n_writer"));
				n.setnTitle(rs.getString("n_title"));
				n.setnContent(rs.getString("n_content"));
				n.setnOriginalFile(rs.getString("n_original_file"));
				n.setnRenamedFile(rs.getString("n_renamed_file"));
				n.setnDate(rs.getDate("n_date"));
				n.setnReadcount(rs.getInt("n_readcount"));
				n.setnStatus(rs.getString("n_status"));
				list.add(n);				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return list;
	}
	
	public int countNotice(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		String sql=prop.getProperty("countNotice");
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) count=rs.getInt("count(*)");
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return count;
	}
	
	public int countNotice(Connection conn,String type,String keyword) {
		Statement stmt=null;
		ResultSet rs=null;
		int count=0;
		String sql="SELECT COUNT(*) FROM NOTICE WHERE "+type+" LIKE '%"+keyword+"%' AND N_STATUS='Y'";
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			if(rs.next()) count=rs.getInt("count(*)");
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return count;
	}
	
	public Notice oneNotice(Connection conn,int nNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("oneNotice");
		Notice n=null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, nNo);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				n=new Notice();
				n.setnNo(rs.getInt("n_no"));
				n.setnWriter(rs.getString("n_writer"));
				n.setnTitle(rs.getString("n_title"));
				n.setnContent(rs.getString("n_content"));
				n.setnOriginalFile(rs.getString("n_original_file"));
				n.setnRenamedFile(rs.getString("n_renamed_file"));
				n.setnDate(rs.getDate("n_date"));
				n.setnReadcount(rs.getInt("n_readcount"));
				n.setnStatus(rs.getString("n_status"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return n;
	}
	
	public int oneDelete(Connection conn,int no) {
		PreparedStatement pstmt=null;
		int count=0;
		String sql=prop.getProperty("oneDelete");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			count=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return count;
	}
	
	public int checkDelete(Connection conn,String[] check) {
		Statement stmt=null;
		int count=0;
		String sql=" ";
		try {
			stmt=conn.createStatement();
			for(String s : check) {
				sql="UPDATE NOTICE SET N_STATUS='N' WHERE N_NO="+s;
				count+=stmt.executeUpdate(sql);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
		}
		return count;
	}
	
	public int insertNotice(Connection conn,Notice n) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertNotice");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, n.getnWriter());
			pstmt.setString(2, n.getnTitle());
			pstmt.setString(3, n.getnContent());
			pstmt.setString(4, n.getnOriginalFile());
			pstmt.setString(5, n.getnRenamedFile());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateNotice(Connection conn, Notice n) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("updateNotice");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, n.getnTitle());
			pstmt.setString(2, n.getnContent());
			pstmt.setString(3, n.getnOriginalFile());
			pstmt.setString(4, n.getnRenamedFile());
			pstmt.setInt(5, n.getnNo());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateReadCount(Connection conn,int nNo) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("upcount");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, nNo);
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int insertComment(Connection conn,NoticeComment nc) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertComment");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, nc.getmNo());
			pstmt.setInt(2, nc.getnNo());
			pstmt.setInt(3, nc.getNcLevel());
			pstmt.setString(4, nc.getNcContent());
			pstmt.setString(5, nc.getNcCommentRef()==0?null:String.valueOf(nc.getNcCommentRef()));
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public List<NoticeComment> selectComment(Connection conn,int nNo){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectComment");
		List<NoticeComment> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, nNo);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				NoticeComment nc=new NoticeComment();
				nc.setNcNo(rs.getInt("nc_no"));
				nc.setmNo(rs.getInt("m_no"));
				nc.setnNo(rs.getInt("n_no"));
				nc.setNcLevel(rs.getInt("nc_level"));
				nc.setNcContent(rs.getString("nc_content"));
				nc.setNcCommentRef(rs.getInt("nc_comment_ref"));
				nc.setNcDate(rs.getDate("nc_date"));
				nc.setNickName(rs.getString("m_nickname"));
				list.add(nc);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public int commentDt(Connection conn,int ncNo) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("commentDt");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, ncNo);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
}
