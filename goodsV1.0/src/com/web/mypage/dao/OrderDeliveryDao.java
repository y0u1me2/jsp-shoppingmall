package com.web.mypage.dao;

import static com.web.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;

import com.web.admin.inquiry.model.dao.AdminInquiryDao;
import com.web.inquiry.model.vo.Inquiry;
import com.web.mypage.vo.OrderDeliveryMember;

public class OrderDeliveryDao {

	private Properties prop = new Properties();

	public OrderDeliveryDao() {
		try {
			String path = AdminInquiryDao.class.getResource("/sql/client/orderDelivery-query.properties").getPath();
			
			prop.load(new FileReader(path));
		
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public List <OrderDeliveryMember> OrderDeliveryMember(Connection conn, int login) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("OrderDeliveryMember");

		List<com.web.mypage.vo.OrderDeliveryMember> od = null;

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, login);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				od = (List<com.web.mypage.vo.OrderDeliveryMember>) new Inquiry();

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return od; // null이거나 주소값이 있거나
	}
}
