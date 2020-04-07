package com.web.mypage.dao;

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

import com.web.admin.inquiry.model.dao.AdminInquiryDao;
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

	public List<OrderDeliveryMember> OrderDeliveryMember(Connection conn, int login) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("OrderDeliveryMember");

		List<OrderDeliveryMember> list = new ArrayList();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, login);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				OrderDeliveryMember ol = new OrderDeliveryMember();
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

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return list; // null이거나 주소값이 있거나
	}

	public int orderDelete(Connection conn,int no) {
		PreparedStatement pstmt = null;
		int result=0;
		String sql = prop.getProperty("orderDelete");
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, no);
		result=pstmt.executeUpdate();
		
		}catch (Exception e) {
		e.printStackTrace();
		}finally {
			close(pstmt);
		}
	return result;
	}
}
