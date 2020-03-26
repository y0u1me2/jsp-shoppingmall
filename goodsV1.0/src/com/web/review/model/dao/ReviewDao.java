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
import com.web.notice.model.vo.Notice;
import com.web.review.model.vo.Review;

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
				r.setRv_Title(rs.getString("RV_TITLE"));
				r.setRv_Content(rs.getString("RV_CONTENT"));
				r.setRv_Star(rs.getInt("RV_STAR"));
				r.setRv_Ori_Name(rs.getString("RV_ORIGINAL_NAME"));
				r.setRv_Re_Name(rs.getString("RV_RENAME_NAME"));
				r.setP_No(rs.getInt("P_NO"));
				r.setM_No(rs.getInt("M_NO"));
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
	

	
//	public int countNotice(Connection conn) {
//		PreparedStatement pstmt=null;
//		ResultSet rs=null;
//		int count=0;
//		String sql=prop.getProperty("countNotice");
//		try {
//			pstmt=conn.prepareStatement(sql);
//			rs=pstmt.executeQuery();
//			if(rs.next()) count=rs.getInt("count(*)");
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(rs);
//			close(pstmt);
//		}
//		return count;
//	}
}
