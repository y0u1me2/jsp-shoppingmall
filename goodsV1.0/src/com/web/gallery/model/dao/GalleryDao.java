package com.web.gallery.model.dao;
import static com.web.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import com.web.gallery.model.vo.Gallery;

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
		String zipFile = null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, gNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				zipFile = rs.getString(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return zipFile;
	}

	public List<Gallery> getGalleryList(Connection conn, HashMap<String, Object> map) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("getGalleryList");
		sql = sql.replace("SORT_TYPE", (String)map.get("sort"));
		List<Gallery> list = new ArrayList<Gallery>();
		int cPage = (Integer)map.get("cPage");
		int numPerPage = (Integer)map.get("numPerPage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, (String)map.get("category"));
			pstmt.setString(2, (String)map.get("pName"));
			pstmt.setInt(3, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(4, cPage * numPerPage);
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

	public int totalDataCount(Connection conn, HashMap<String, Object> map) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("totalDataCount");
		int count = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, (String)map.get("category"));
			pstmt.setString(2, (String)map.get("pName"));
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
