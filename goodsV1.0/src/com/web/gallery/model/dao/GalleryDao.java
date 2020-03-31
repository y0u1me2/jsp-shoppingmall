package com.web.gallery.model.dao;
import static com.web.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.web.gallery.model.vo.Gallery;
import com.web.inquiry.model.vo.Inquiry;

public class GalleryDao {
	private Properties prop = new Properties();
	
	public GalleryDao() {
		try {
			String path=GalleryDao.class.getResource("/sql/client/gallery-query.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertNewGallery(Connection conn, int cNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertNewGallery");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public String getZipFilename(Connection conn, int gNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("getZipFilename");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, gNo);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

	public List<Gallery> getGalleryList(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("getGalleryList");
		List<Gallery> list = new ArrayList<Gallery>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(2, cPage * numPerPage);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Gallery g = new Gallery();
				g.setgNo(rs.getInt("G_NO"));
				g.setcNo(rs.getInt("C_NO"));
				g.setEnrollDate(rs.getDate("G_ENROLL_DATE"));
				g.setLikeCnt(rs.getInt("LIKE_CNT"));
				g.setViewCnt(rs.getInt("VIEW_CNT"));
				g.setFilename(rs.getString("C_COMPLETE_FILE"));
				list.add(g);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int totalDataCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("totalDataCount");
		int count = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return count;
	}
	
	
	
}
