package com.web.admin.order.model.dao;

import static com.web.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.web.admin.order.model.vo.OrderList;

public class AdminOrderListDao {
	private Properties prop=new Properties();
	
	public AdminOrderListDao() {
		try {
			String path=AdminOrderListDao.class.getResource("/sql/admin/orderList-query.properties").getPath();
			prop.load(new FileInputStream(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<OrderList> selectOrderList(Connection conn,int cPage,int numPerPage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectOrderList");
		List<OrderList> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,(cPage-1)*numPerPage+1 );
			pstmt.setInt(2, cPage*numPerPage );
			rs=pstmt.executeQuery();
			while(rs.next()) {
				OrderList ol=new OrderList();
				ol.setoNo(rs.getInt("o_no"));
				ol.setCfileName(rs.getString("c_complete_file"));
				ol.setpName(rs.getString("p_name"));
				ol.setcColor(rs.getString("c_color"));
				ol.settPrice(rs.getInt("p_price"));
				ol.setoQuan(rs.getInt("o_quan"));
				ol.setoName(rs.getString("o_name"));
				ol.setoDate(rs.getDate("o_date"));
				ol.setcNo(rs.getInt("c_no"));
				list.add(ol);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public List<OrderList> searchOrderList(Connection conn,int cPage,int numPerPage,String type,String keyword) {
		Statement stmt=null;
		ResultSet rs=null;
		String sql="SELECT * FROM "
				+ "(SELECT ROWNUM AS RNUM,A.* FROM(SELECT * FROM PAYMENTDETAIL PD JOIN CUSTOM C USING(C_NO) JOIN PRODUCT P ON C.P_NO=P.P_NO JOIN PAYMENT PM USING(O_NO) WHERE "+type+" LIKE '%"+keyword+"%' ORDER BY O_NO) A) "
						+ "WHERE RNUM BETWEEN "+((cPage-1)*numPerPage+1)+" AND "+(cPage*numPerPage);
		List<OrderList> list=new ArrayList();
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				OrderList ol=new OrderList();
				ol.setoNo(rs.getInt("o_no"));
				ol.setCfileName(rs.getString("c_complete_file"));
				ol.setpName(rs.getString("p_name"));
				ol.setcColor(rs.getString("c_color"));
				ol.settPrice(rs.getInt("p_price"));
				ol.setoQuan(rs.getInt("o_quan"));
				ol.setoName(rs.getString("o_name"));
				ol.setoDate(rs.getDate("o_date"));
				ol.setcNo(rs.getInt("c_no"));
				list.add(ol);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return list;
	}
	
	public int amountOrderList(Connection conn) {
		Statement stmt=null;
		ResultSet rs=null;
		String sql="SELECT COUNT(*) CO FROM PAYMENTDETAIL";
		int count=0;
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			if(rs.next()) count=rs.getInt("co");
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return count;
	}
	
	public int amountOrderList(Connection conn,String type,String keyword) {
		Statement stmt=null;
		ResultSet rs=null;
		String sql="SELECT COUNT(*) CO FROM PAYMENTDETAIL JOIN CUSTOM C USING(C_NO) JOIN PRODUCT USING(P_NO) WHERE "+type+" LIKE '%"+keyword+"%'";
		int count=0;
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			if(rs.next()) count=rs.getInt("co");
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return count;
	}
	
	public int totalPrice(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int total=0;
		String sql=prop.getProperty("totalPrice");
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) total=rs.getInt("sum");
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return total;
	}
	
	public int totalPrice(Connection conn,String keyword,String type) {
		Statement stmt=null;
		ResultSet rs=null;
		int total=0;
		String sql="SELECT SUM(O_TOTALPRICE) AS SUM FROM PAYMENTDETAIL JOIN PAYMENT USING(O_NO) JOIN CUSTOM USING(C_NO) JOIN PRODUCT USING(P_NO) WHERE "+type+" LIKE '%"+keyword+"%'";
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			if(rs.next()) total=rs.getInt("sum");
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return total;
	}
	
	
	public int deleteOrderList(Connection conn,int no) {
		Statement stmt=null;
		int result=0;
		String sql="DELETE FROM ORDER_LIST WHERE OL_NO="+no;
		try {
			stmt=conn.createStatement();
			result=stmt.executeUpdate(sql);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
		}
		return result;
	}
	
	public int checkdelete(Connection conn,String[] check) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("1");
		try {
			pstmt=conn.prepareStatement(sql);
			for(String s : check) {
				pstmt.setString(1, s);
				result+=pstmt.executeUpdate();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	
	
}
