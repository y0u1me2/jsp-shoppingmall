package com.web.mypage.service;

import static com.web.common.JDBCTemplate.close;
import static com.web.common.JDBCTemplate.getConnection;
import static com.web.common.JDBCTemplate.commit;
import static com.web.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.web.mypage.dao.OrderDeliveryDao;
import com.web.mypage.vo.ODMember;

public class OrderDeliveryService {

	private OrderDeliveryDao dao = new OrderDeliveryDao();

	public List<ODMember> OrderDeliveryMember(int login) {
		Connection conn = getConnection();
		List<com.web.mypage.vo.ODMember> od = dao.OrderDeliveryMember(conn, login);
		close(conn);
		return od;
	}
	public int orderDelete(int no) {
		Connection conn=getConnection();
		int result= dao.orderDelete(conn,no);
		if(result>0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int statusUpdate(int cNo) {
		Connection conn=getConnection();
		int sResult= dao.statusUpdate(conn,cNo);
		if(sResult>0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		close(conn);
		return sResult;
	}
	
}
