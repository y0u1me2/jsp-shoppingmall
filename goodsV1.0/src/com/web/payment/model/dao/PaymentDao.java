package com.web.payment.model.dao;
import static com.web.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.web.payment.model.vo.Payment;
import com.web.payment.model.vo.PaymentDetail;

public class PaymentDao {
	
	Properties prop=new Properties();
	
	public PaymentDao() {
		try {
			String path=PaymentDao.class.getResource("/sql/payment/payment-query.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	public int insertPayment(Connection conn,Payment p) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertPayment");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, p.getM_No());
			pstmt.setString(2, p.getO_Name());
			pstmt.setString(3, p.getO_Phone());
			pstmt.setString(4, p.getO_Email());
			pstmt.setString(5, p.getR_Name());
			pstmt.setString(6, p.getR_Phone());
			pstmt.setString(7, p.getR_Address());
			pstmt.setString(8, p.getR_Post());
			pstmt.setString(9, p.getO_TotalPrice());
			pstmt.setString(10, p.getO_PayWay());
			pstmt.setInt(11, p.getO_Delivery());
			pstmt.setString(12, p.getO_Cnos());
			result = pstmt.executeUpdate();
					
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int OrderNoPayment(Connection conn, String oNos) {
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		int result=0;
		String sql=prop.getProperty("orderNoPayment");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, oNos);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt("O_NO");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public int insertPaymentDetail(Connection conn,PaymentDetail pd) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertPaymentDetail");
		try {
			pstmt=conn.prepareStatement(sql);
			for(int i=0;i<pd.getcNo().length;i++) {
				pstmt.setInt(1, pd.getoNo());
				pstmt.setString(2, pd.getcNo()[i]);
				pstmt.setString(3, pd.getoQuan()[i]);
				result+=pstmt.executeUpdate();
			}
			if(result!=pd.getcNo().length) {
				result=0;
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
}
