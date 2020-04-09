package com.web.admin.dashboard.dao;
import static com.web.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Properties;

import com.web.admin.inquiry.model.dao.AdminInquiryDao;
import com.web.gallery.model.vo.Gallery2;

public class AdminDashboardDao {

	private Properties prop = new Properties();

	public AdminDashboardDao() {
		try {
			String path = AdminInquiryDao.class.getResource("/sql/admin/dashboard-query.properties").getPath();

			prop.load(new FileReader(path));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//인기상품 조회(top5)
	public LinkedHashMap<String, Integer> top5Product(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("top5Product");
		LinkedHashMap<String, Integer> map = new LinkedHashMap<String, Integer>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				map.put(rs.getString(1), rs.getInt(2));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return map;
	}

	public List<Gallery2> top5Gallery(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("top5Gallery");
		List<Gallery2> list = new ArrayList<Gallery2>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Gallery2 g = new Gallery2();
				g.setmNickname(rs.getString("M_NICKNAME"));
				g.setFilename(rs.getString("C_COMPLETE_FILE"));
				g.setDownCnt(rs.getInt("down_cnt"));
				list.add(g);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public LinkedHashMap<String, Integer> salesCheck(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("salesCheck");
		LinkedHashMap<String, Integer> map = new LinkedHashMap<String, Integer>();
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				map.put(rs.getString(1), rs.getInt(2));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return map;
	}

	public LinkedHashMap<String, Integer> visitorCheck(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("visitorCheck");
		LinkedHashMap<String, Integer> map = new LinkedHashMap<String, Integer>();
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				map.put(rs.getString(1), rs.getInt(2));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return map;
	}

}
