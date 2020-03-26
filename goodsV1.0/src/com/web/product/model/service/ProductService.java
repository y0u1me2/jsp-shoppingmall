package com.web.product.model.service;

import static com.web.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.LinkedHashMap;
import java.util.List;

import com.web.product.model.dao.ProductDao;
import com.web.product.model.vo.Custom;
import com.web.product.model.vo.Product;

public class ProductService {
	private ProductDao dao = new ProductDao();

	public Product getProduct(int pNo) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		Product p = dao.getProduct(conn, pNo);
		close(conn);
		
		return p;
	}

	public LinkedHashMap<String, String> getProductImages(int pNo) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		LinkedHashMap<String, String> images = dao.getProductImages(conn, pNo);
		close(conn);
		
		return images;
	}

	public List<Product> selectByCategory(String category) {
		Connection conn = getConnection();
		List<Product> list = dao.selectByCategory(conn, category);
		close(conn);
		return list;
	}

	public int insertCustom(Custom c) {
		Connection conn = getConnection();
		int result = dao.insertCustom(conn, c);
		
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		
		return result;
	}
	
	
}
