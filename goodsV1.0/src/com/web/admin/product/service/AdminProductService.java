package com.web.admin.product.service;

import static com.web.common.JDBCTemplate.close;
import static com.web.common.JDBCTemplate.commit;
import static com.web.common.JDBCTemplate.getConnection;
import static com.web.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.web.admin.product.model.dao.AdminProductDao;
import com.web.member.model.vo.Member;
import com.web.product.model.vo.Product;
import com.web.product.model.vo.ProductImage;

public class AdminProductService {
	
	private AdminProductDao dao = new AdminProductDao();
	
//상품 등록====================================
	public int productEnroll(Product p,ProductImage pi){
		Connection conn = getConnection();
		
		int result = dao.productEnroll(conn,p);
		
		if(result>0) {
			dao.productColor(conn,pi);
			commit(conn);
		}
		else rollback(conn);
			
		close(conn);
		
		return result;
	} 	
	
//메뉴 카테고리 추가하기=========================
	public List<Product> productCategory(){
		Connection conn = getConnection();
		
		List<Product> list = dao.productCategory(conn);
		
		close(conn);
		
		return list;
			
	}
	
//상품수정하기===================================
	public int updateProduct(Product p) {
		Connection conn = getConnection();
			
		int result = dao. updateProduct(conn,p);
			
			if(result>0) commit(conn);
			else rollback(conn);
			
			close(conn);
			
			return result;
	}
	
}
