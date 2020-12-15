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

import com.web.inquiry.model.vo.Inquiry;
import com.web.member.model.vo.Member;
import com.web.product.model.vo.Custom;
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

//상품번호 시퀀스 가져오기============================================
	public int selectSeqNum(Connection conn,Product p) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectSeqNum");
		int pNo = 0;
		
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, p.getpName());
				pstmt.setInt(2, p.getpPrice());
				pstmt.setString(3, p.getpCategory());
				pstmt.setString(4, p.getpThumbnail());
				pstmt.setString(5, p.getpComment());
		
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					pNo=rs.getInt(1);
				
				}	
										
		}catch(SQLException e){
		e.printStackTrace();
		}finally{
			close(rs);
		close(pstmt);
		}return pNo;  // 상품번호 반환

	}

//상품 색상 등록================================================
	public int productColor(Connection conn, ProductImage pi,int pNo) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("productColor");
		int result = 0;
			
		try {
			pstmt = conn.prepareStatement(sql);
							
				pstmt.setInt(1,pNo);
				pstmt.setString(2, pi.getColor().toString());
				pstmt.setString(3, pi.getFileName().toString());			
				result = pstmt.executeUpdate();

			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

//상품정보수정============================================
	public int updateProduct(Connection conn, Product p) {
		PreparedStatement pstmt = null;
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
	
	
//상품색상추가================================================
	public int updateColor(Connection conn, ProductImage pi, int pNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateColor");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,pNo);
			pstmt.setString(2, pi.getColor().toString());
			pstmt.setString(3, pi.getFileName().toString());		
			
			result = pstmt.executeUpdate();
							
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
		

//상품전체조회=======================================	
	public List<Product> productList(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("productList");

		List<Product> list = new ArrayList();

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(2, cPage * numPerPage);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Product p = new Product();

				p.setpNo(rs.getInt("p_no"));
				p.setpName(rs.getString("p_name"));
				p.setpPrice(rs.getInt("p_price"));
				p.setpCategory(rs.getString("p_category"));
				p.setpThumbnail(rs.getString("p_thumbnail"));
				p.setpComment(rs.getString("p_comment"));
				p.setpStatus(rs.getString("p_status"));
				
				
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

//상품전체조회 페이지바========================================
	public int productCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("productCount");

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return result;

	}

//상품수정화면 출력===================================
	public Product searchProduct(Connection conn,int no) {

			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = prop.getProperty("searchProduct");
			
			Product p = null;
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setInt(1, no);
				rs=pstmt.executeQuery();
						
				if(rs.next()) {
					p=new Product();
					
					p.setpNo(rs.getInt("p_no"));
					p.setpName(rs.getString("p_name"));
					p.setpPrice(rs.getInt("p_price"));
					p.setpCategory(rs.getString("p_category"));
					p.setpThumbnail(rs.getString("p_thumbnail"));
					p.setpComment(rs.getString("p_comment"));
					p.setpStatus(rs.getString("p_status"));
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}	
			return p;
		}

//상품삭제=============================================
	public int productCkDelete(Connection conn, String[] pCkDelete) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("prdodctCkDelete");

		for (int i = 0; i<pCkDelete.length; i++) {
			System.out.println(pCkDelete[i]);
		}

		try {
			pstmt = conn.prepareStatement(sql);
			for (int i = 0; i < pCkDelete.length; i++) {
				pstmt.setString(1, pCkDelete[i]);
				result = pstmt.executeUpdate();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	/*
	 * //상품색상삭제화면 출력========================================= public Product
	 * SearchProductNo(Connection conn,int no) {
	 * 
	 * PreparedStatement pstmt = null; ResultSet rs = null; String sql =
	 * prop.getProperty("searchProduct");
	 * 
	 * Product p = null;
	 * 
	 * try { pstmt=conn.prepareStatement(sql);
	 * 
	 * pstmt.setInt(1, no); rs=pstmt.executeQuery();
	 * 
	 * if(rs.next()) { p=new Product();
	 * 
	 * p.setpNo(rs.getInt("p_no")); p.setpName(rs.getString("p_name"));
	 * p.setpPrice(rs.getInt("p_price"));
	 * p.setpCategory(rs.getString("p_category"));
	 * p.setpThumbnail(rs.getString("p_thumbnail"));
	 * p.setpComment(rs.getString("p_comment"));
	 * p.setpStatus(rs.getString("p_status")); } }catch(SQLException e) {
	 * e.printStackTrace(); }finally { close(rs); close(pstmt); } return p; }
	 */
	
//상품색상삭제=========================================
	public int colorDelete(Connection conn,int no,String [] color) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("colorDelete");

		for (int i = 0; i<color.length; i++) {
			System.out.println(color[i]);
		}

		try {
			pstmt = conn.prepareStatement(sql);
			for (int i = 0; i <color.length; i++) {
				pstmt.setString(1, color[i]);
				pstmt.setInt(2, no);
				result = pstmt.executeUpdate();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
//상품목록 엑셀다운로드===========================================
	public List<Product> excelDownLoad(Connection conn){
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Product> list = new ArrayList();
			String sql = prop.getProperty("excelDownLoad");

			try {
				pstmt = conn.prepareStatement(sql);
		
				rs = pstmt.executeQuery();

				while (rs.next()) {
					Product p = new Product();
					p.setpNo(rs.getInt("p_no"));
					p.setpName(rs.getString("p_name"));
					p.setpPrice(rs.getInt("p_price"));
					p.setpCategory(rs.getString("p_category"));
					p.setpThumbnail(rs.getString("p_thumbnail"));
					p.setpComment(rs.getString("p_comment"));
					p.setpStatus(rs.getString("p_status"));
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

}
