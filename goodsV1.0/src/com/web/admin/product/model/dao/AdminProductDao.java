package com.web.admin.product.model.dao;

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

import com.web.member.model.vo.Member;
import com.web.product.model.vo.Product;
import com.web.product.model.vo.ProductImage;

public class AdminProductDao {

	private Properties prop = new Properties();

	public AdminProductDao() {
		try {
			String path = AdminProductDao.class.getResource("/sql/admin/product-query.properties").getPath();

			prop.load(new FileReader(path));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

//상품등록====================================
	public int productEnroll(Connection conn, Product p) {

		PreparedStatement pstmt = null;
		String sql = prop.getProperty("productEnroll");
		int result = 0;

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, p.getpName());
			pstmt.setInt(2, p.getpPrice());
			pstmt.setString(3, p.getpCategory());
			pstmt.setString(4, p.getpThumbnail());
			pstmt.setString(5, p.getpComment());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

//상품 색상 등록================================================
	public int productColor(Connection conn, ProductImage pi) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("productColor");
		int result = 0;

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, pi.getColor());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

//메뉴카테고리 추가=====================================
	public List<Product> productCategory(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Product> list = new ArrayList();
		String sql = prop.getProperty("productCategory");

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Product p = new Product();
				p.setpNo(rs.getInt("p_no"));
				p.setpName(rs.getString("p_name"));

				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;

	}

//상품정보수정============================================
	public int updateProduct(Connection conn,Product p) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int result = 0;
			
			String sql = prop.getProperty("updateProduct");
	
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, p.getpName());
			pstmt.setInt(2, p.getpPrice());
			pstmt.setString(3, p.getpCategory());
			pstmt.setString(4, p.getpThumbnail());
			pstmt.setString(5, p.getpComment());
			pstmt.setInt(6, p.getpNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}
