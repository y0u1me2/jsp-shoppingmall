package com.web.mypage.service;

import static com.web.common.JDBCTemplate.close;
import static com.web.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.web.mypage.dao.OrderDeliveryDao;
import com.web.mypage.vo.OrderDeliveryMember;

public class OrderDeliveryService {

	private OrderDeliveryDao dao = new OrderDeliveryDao();

	public List<OrderDeliveryMember> OrderDeliveryMember(int login) {
		Connection conn = getConnection();
		List<com.web.mypage.vo.OrderDeliveryMember> od = dao.OrderDeliveryMember(conn, login);
		close(conn);
		return od;
	}
}
