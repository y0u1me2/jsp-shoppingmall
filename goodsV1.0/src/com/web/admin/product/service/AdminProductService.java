package com.web.admin.product.service;

import static com.web.common.JDBCTemplate.close;
import static com.web.common.JDBCTemplate.commit;
import static com.web.common.JDBCTemplate.getConnection;
import static com.web.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.web.admin.product.model.dao.AdminProductDao;
import com.web.inquiry.model.vo.Inquiry;
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
	
//헤더 메뉴 추가하기=========================
	public List<Product> productHeaderMenu(){
		Connection conn = getConnection();
		
		List<Product> list = dao.productHeaderMenu(conn);
		
		close(conn);
		
		return list;
			
	}
	
	public List<Product> productInfo(int no) {
		Connection conn = getConnection();
		
		List<Product> listP = dao.productInfo(conn,no);
		
		close(conn);
		
		return listP;
		
	}
	
	
//상품정보수정하기===================================
	public int updateProduct(Product p) {
		Connection conn = getConnection();
			
		int result = dao. updateProduct(conn,p);
			
			if(result>0) commit(conn);
			else rollback(conn);
			
			close(conn);
			
			return result;
	}

//상품전체조회===================================
	public List<Product> productList(int cPage, int numPerPage){
		Connection conn = getConnection();
		List<Product> list = dao.productList(conn,cPage,numPerPage);
			
		close(conn);
					
		return list;					
	}

//상품전체조회 페이지바==================================
	public int productCount() {
		Connection conn = getConnection();
			
		int result = dao.productCount(conn);
		close(conn);
			
		return result;		
	}	

//상품수정화면 출력=========================================
	public Product searchProduct(int no) {
		Connection conn = getConnection();
		
		Product p = dao.searchProduct(conn,no);
		close(conn);
		
		return p;
	}

//상품삭제=====================================================
	public int productCkDelete(String [] pCkDelete) {
		 Connection conn = getConnection();
		  
		  int result = dao. productCkDelete(conn, pCkDelete); 
		  
		  if(result>0) commit(conn);
		  else rollback(conn); close(conn);
		  
		  return result; 
		  
		 }	
	
//상품리스트 엑셀 다운로드=======================================
	public List<Product> excelDownLoad(){
		Connection conn = getConnection();
		
		List<Product> list = dao.excelDownLoad(conn);
		
		close(conn);
		
		return list;
			
	}
	
	
}
