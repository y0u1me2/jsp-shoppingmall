package com.web.cart.model.dao;
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

import com.web.admin.member.model.dao.AdminMemberDao;
import com.web.cart.model.vo.Cart;

public class CartDao {
		
		Properties prop=new Properties();
		
		public CartDao() {
			try {
				String path=AdminMemberDao.class.getResource("/sql/client/cart-query.properties").getPath();
				prop.load(new FileReader(path));
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		
		
		public Cart searchCart(Connection conn,String num){
			PreparedStatement pstmt=null;
			ResultSet rs = null;
			String sql=prop.getProperty("searchCart");
			Cart c=null;
			try {
				pstmt=conn.prepareStatement(sql);
					pstmt.setString(1,num); //시작데이터 번호 rum기준

					rs=pstmt.executeQuery();
					if(rs.next()) {
					c = new Cart();
					c.setcImage(rs.getString("c_complete_file"));
			        c.setcName(rs.getString("p_name"));
			        c.setcPrice(rs.getInt("p_price"));
			        c.setcDate(rs.getDate("c_enroll_date"));
			        c.setcCno(rs.getInt("c_no"));
					}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
		         close(rs);
		         close(pstmt);
		      }
		      return c;
			
		}
	
}
