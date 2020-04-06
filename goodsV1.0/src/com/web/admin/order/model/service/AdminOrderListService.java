package com.web.admin.order.model.service;

import static com.web.common.JDBCTemplate.getConnection;
import static com.web.common.JDBCTemplate.close;
import static com.web.common.JDBCTemplate.commit;
import static com.web.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.web.admin.order.model.dao.AdminOrderListDao;
import com.web.admin.order.model.vo.OrderList;

public class AdminOrderListService {
	private AdminOrderListDao dao=new AdminOrderListDao();
	
	public List<OrderList> selectOrderList(int cPage,int numPerPage) {
		Connection conn=getConnection();
		List<OrderList> list=dao.selectOrderList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	public List<OrderList> searchOrderList(int cPage,int numPerPage,String type,String keyword){
		Connection conn=getConnection();
		List<OrderList> list=dao.searchOrderList(conn,cPage,numPerPage,type,keyword);
		close(conn);
		return list;
	}
	
	public int amountOrderList() {
		Connection conn=getConnection();
		int count=dao.amountOrderList(conn);
		close(conn);
		return count;
	}
	
	public int amountOrderList(String type,String keyword) {
		Connection conn=getConnection();
		int count=dao.amountOrderList(conn,type,keyword);
		close(conn);
		return count;
	}
	
	public int totalPrice() {
		Connection conn=getConnection();
		int count=dao.totalPrice(conn);
		close(conn);
		return count;
	}
	
	public int totalPrice(String type,String keyword) {
		Connection conn=getConnection();
		int count=dao.totalPrice(conn,type,keyword);
		close(conn);
		return count;
	}
	
	
	public int deleteOrderList(int no) {
		Connection conn=getConnection();
		int result=dao.deleteOrderList(conn,no);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
		
	}
	
	public int checkdelete(String[] check) {
		Connection conn=getConnection();
		int result=dao.checkdelete(conn,check);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	
	
	
	
	
}
