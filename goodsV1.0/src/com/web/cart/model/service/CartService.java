package com.web.cart.model.service;
import static com.web.common.JDBCTemplate.close;
import static com.web.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.web.cart.model.dao.CartDao;
import com.web.cart.model.vo.Cart;
public class CartService {


		private CartDao dao = new CartDao();
		
		public List<Cart> searchCart(String[] cart){
			//connection관리
			Connection conn = getConnection();
			List<Cart> list = new ArrayList();
			for(String no : cart)
			{
				list.add(dao.searchCart(conn,no));
			}
			close(conn);
			return list;
			
		}
		
	
	

}
