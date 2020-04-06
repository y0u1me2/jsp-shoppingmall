package com.web.product.model.dao;
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
import java.util.TreeMap;

import com.web.product.model.vo.Custom;
import com.web.product.model.vo.Product;

public class ProductDao {
	private Properties prop = new Properties();
	
	public ProductDao() {
		try {
			String path=ProductDao.class.getResource("/sql/client/product-query.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	//특정 한 개 제품 정보 가져오기 
	public Product getProduct(Connection conn, int pNo) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Product p = null;
		String sql = prop.getProperty("selectOneProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				p = new Product();
				p.setpNo(rs.getInt("p_no"));
				p.setpName(rs.getString("p_name"));
				p.setpCategory(rs.getString("p_category"));
				p.setpComment(rs.getString("p_comment"));
				p.setpPrice(rs.getInt("p_price"));
				p.setpThumbnail(rs.getString("p_thumbnail"));
				p.setpSize(rs.getString("p_size"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return p;//null이거나 아니거나
	}

	//특정 한 개 제품의 이미지들 가져오기
	public LinkedHashMap<String, String> getProductImages(Connection conn, int pNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		LinkedHashMap<String, String> images = new LinkedHashMap<String, String>();
		String sql = prop.getProperty("selectProductImages");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				images.put(rs.getString("p_color"), rs.getString("file_name"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return images;
	}

	public List<Product> selectByCategory(Connection conn, String category) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Product> list = new ArrayList<Product>();
		String sql = prop.getProperty("selectByCategory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Product p = new Product();
				p.setpNo(rs.getInt("p_no"));
				p.setpName(rs.getString("p_name"));
				p.setpCategory(rs.getString("p_category"));
				p.setpComment(rs.getString("p_comment"));
				p.setpPrice(rs.getInt("p_price"));
				p.setpThumbnail(rs.getString("p_thumbnail"));
				list.add(p);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int insertCustom(Connection conn, Custom c) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertCustom");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c.getmNo());
			pstmt.setInt(2, c.getpNo());
			pstmt.setString(3, c.getColor());
			pstmt.setString(4, c.getCompleteFile());
			pstmt.setString(5, c.getOriginalFile());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int getCustomNo(Connection conn, Custom c) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("getCustomNo");
		int cno = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c.getmNo());
			pstmt.setInt(2, c.getpNo());
			pstmt.setString(3, c.getColor());
			pstmt.setString(4, c.getCompleteFile());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cno = rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return cno; //커스텀 번호 반환, 에러시 0 반환
	}
	
	//특정 한 개 커스텀 정보 가져오기(cNo -> Custom VO) 
	public Custom getCustom(Connection conn, int cNo) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Custom c = null;
		String sql = prop.getProperty("selectOneCustom");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				c = new Custom();
				c.setcNo(rs.getInt("C_NO"));
				c.setColor(rs.getString("C_COLOR"));
				c.setCompleteFile(rs.getString("c_complete_file"));
				c.setEnrollDate(rs.getDate("c_enroll_date"));
				c.setmNo(rs.getInt("m_no"));
				c.setOriginalFile(rs.getString("c_original_file"));
				c.setpNo(rs.getInt("p_no"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return c;//null이거나 아니거나
	}
	

//	public int insertCustomImage(Connection conn, int cno, String file) {
//		PreparedStatement pstmt = null;
//		int result = 0;
//		String sql = prop.getProperty("insertCustomImage");
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, cno);
//			pstmt.setString(2, file);
//			result = pstmt.executeUpdate();
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(pstmt);
//		}
//		return result;
//	}

}
