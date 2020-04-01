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
		//고쳐야할부분
		String sql=prop.getProperty("key");
		List<OrderList> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql);
			//고쳐야할부분
			pstmt.setString(1, "");
			rs=pstmt.executeQuery();
			while(rs.next()) {
				//고쳐야할부분
				OrderList ol=new OrderList();
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
	
	public int amountOrderList(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		//고쳐야할부분
		String sql=prop.getProperty("key");
		int count=0;
		try {
			pstmt=conn.prepareStatement(sql);
			//고쳐야할부분
			rs=pstmt.executeQuery();
			//고쳐야할부분
			if(rs.next()) count=rs.getInt(0);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return count;
	}
	
	public int amountOrderList(Connection conn,String type,String keyword) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		//고쳐야할부분
		String sql=prop.getProperty("key");
		int count=0;
		try {
			pstmt=conn.prepareStatement(sql);
			//고쳐야할 부분
			pstmt.setString(1, "1");
			pstmt.setString(2, "2");
			//고쳐야할부분
			rs=pstmt.executeQuery();
			//고쳐야할부분
			if(rs.next()) count=rs.getInt(0);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return count;
	}
	
	public List<OrderList> searchOrderList(Connection conn,int cPage,int numPerPage,String type,String keyword) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		//고쳐야할부분
		String sql=prop.getProperty("key");
		List<OrderList> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql);
			//고쳐야할부분
			pstmt.setInt(1, 1);
			pstmt.setInt(2, 2);
			pstmt.setString(3, "3");
			pstmt.setString(4, "4");
			rs=pstmt.executeQuery();
			while(rs.next()) {
				//고쳐야할부분
				OrderList ol=new OrderList();
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
