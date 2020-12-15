package com.web.review.model.dao;

import static com.web.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.web.notice.model.dao.NoticeDao;
import com.web.review.model.vo.*;

public class ReviewDao {
	
	private Properties prop=new Properties();
	
	public ReviewDao() {
		try {
			String path=NoticeDao.class.getResource("/sql/client/review.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Review> searchReview(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("searchReview");
		List<Review> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Review r=new Review();
				r.setRv_No(rs.getInt("RV_NO"));
				r.setRv_Content(rs.getString("RV_CONTENT"));
				r.setRv_Star(rs.getInt("RV_STAR"));
				r.setRv_Ori_Name(rs.getString("RV_ORIGINAL_NAME"));
				r.setRv_Re_Name(rs.getString("RV_RENAME_NAME"));
				r.setC_No(rs.getInt("C_NO"));
				r.setM_No(rs.getInt("M_NO"));
				r.setM_nickName(rs.getString("M_NICKNAME"));
				r.setRv_Date(rs.getDate("RV_DATE"));
				
				list.add(r);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public int countReview(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		String sql=prop.getProperty("countReview");
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
	
	public int countReviewCategory(Connection conn, String p_Category) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		String sql=prop.getProperty("countReviewCategory");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, p_Category);
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
	
	public Review reviewView(Connection conn, int reviewNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("reviewView");
		Review r=new Review();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, reviewNo);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				r.setRv_No(rs.getInt("RV_NO"));
				r.setRv_Content(rs.getString("RV_CONTENT"));
				r.setRv_Star(rs.getInt("RV_STAR"));
				r.setRv_Ori_Name(rs.getString("RV_ORIGINAL_NAME"));
				r.setRv_Re_Name(rs.getString("RV_RENAME_NAME"));
				r.setC_No(rs.getInt("C_NO"));
				r.setM_No(rs.getInt("M_NO"));
				r.setM_nickName(rs.getString("M_NICKNAME"));
				r.setRv_Date(rs.getDate("RV_DATE"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return r;
	}
	
	public List<Review> searchMyReview(Connection conn, int myNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("searchMyReview");
		List<Review> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, myNo);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Review r=new Review();
				r.setRv_No(rs.getInt("RV_NO"));
				r.setRv_Content(rs.getString("RV_CONTENT"));
				r.setRv_Star(rs.getInt("RV_STAR"));
				r.setRv_Ori_Name(rs.getString("RV_ORIGINAL_NAME"));
				r.setRv_Re_Name(rs.getString("RV_RENAME_NAME"));
				r.setC_No(rs.getInt("C_NO"));
				r.setM_No(rs.getInt("M_NO"));
				r.setM_nickName(rs.getString("M_NICKNAME"));
				r.setRv_Date(rs.getDate("RV_DATE"));
				list.add(r);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public int countMyReview(Connection conn, int myNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		String sql=prop.getProperty("countMyReview");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, myNo);
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
	
	public List<Review> searchReviewCategory(Connection conn, String p_Category) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("searchReviewCategory");
		List<Review> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, p_Category);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Review r=new Review();
				r.setRv_No(rs.getInt("RV_NO"));
				r.setRv_Content(rs.getString("RV_CONTENT"));
				r.setRv_Star(rs.getInt("RV_STAR"));
				r.setRv_Ori_Name(rs.getString("RV_ORIGINAL_NAME"));
				r.setRv_Re_Name(rs.getString("RV_RENAME_NAME"));
				r.setC_No(rs.getInt("C_NO"));
				r.setM_No(rs.getInt("M_NO"));
				r.setM_nickName(rs.getString("M_NICKNAME"));
				r.setRv_Date(rs.getDate("RV_DATE"));
				list.add(r);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public int insertReview(Connection conn, Review r) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReview");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, r.getM_No());
			pstmt.setInt(2, r.getC_No());
			pstmt.setString(3, r.getRv_Content());
			pstmt.setInt(4, r.getRv_Star());
			pstmt.setString(5, r.getRv_Ori_Name());
			pstmt.setString(6, r.getRv_Re_Name());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;// 0이나 1이 반환(행 업데이트)
	}
	
	public List<ReviewAble> searchWriteAbleReview(Connection conn, int myNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("searchWriteAbleReview");
		List<ReviewAble> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, myNo);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ReviewAble r=new ReviewAble();
				r.setcNo(rs.getInt("C_NO"));
				r.setpName(rs.getString("P_NAME"));
				r.setcFileName(rs.getString("C_COMPLETE_FILE"));
				r.setoDate(rs.getDate("O_DATE"));
				list.add(r);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public int countMyWriteAbleReview(Connection conn, int myNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		String sql=prop.getProperty("countMyWriteAbleReview");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, myNo);
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
	

}
