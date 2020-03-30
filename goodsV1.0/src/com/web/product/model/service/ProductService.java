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

	//커스텀 상품 등록+커스텀에 사용한 원본이미지 등록
	public int insertCustom(Custom c, List<String> files) {
		Connection conn = getConnection();
		int count = 0;
		if(dao.insertCustom(conn, c)>0) {//custom 제품 등록 성공
			int cno = dao.getCustomNo(conn, c);//방금 등록한 커스텀 제품 번호 조회
			for(String file : files) {//커스텀에 사용한 이미지 파일을 하나씩 디비에 저장
				int result = dao.insertCustomImage(conn, cno, file);
				if(result==0) {//이미지 파일 등록 실패 시 롤백
					rollback(conn);
					return 0;
				}else count++;
			}
		}else {//custom 제품 등록 실패
			rollback(conn);
			return 0;
		}
		commit(conn);
		close(conn);
		
		return count;//총 등록한 이미지 개수 리턴
	}


	
	
	
}
