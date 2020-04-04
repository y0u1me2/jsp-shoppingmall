package com.web.payment.model.service;
import static com.web.common.JDBCTemplate.close;
import static com.web.common.JDBCTemplate.commit;
import static com.web.common.JDBCTemplate.getConnection;
import static com.web.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.web.payment.model.dao.PaymentDao;
import com.web.payment.model.vo.Payment;
import com.web.payment.model.vo.PaymentDetail;

public class PaymentService {
	private PaymentDao dao = new PaymentDao();
	
	
//	public int insertPayment(int oNo,String mNo,Date oDate,String oName,
//			String oPhone,String oEmail,String rName,String rPhone,
//			String rAddress,String rPost,String tPrice,String oPayWay, int oDelivery) {
//		
//		
//	}
	
	public int insertPayment(Payment p) {
		Connection conn=getConnection();
		int result =dao.insertPayment(conn, p);
		if(result>0)commit(conn);
		else rollback(conn);
		close(conn);
		return result;
		
	}
	
	public int orderNoPayment(String oNos) {
		Connection conn=getConnection();
		int result =dao.OrderNoPayment(conn, oNos);
		close(conn);
		return result;
		
	}
	public int insertPaymentDtail(PaymentDetail pd) {
		Connection conn=getConnection();
		int result =dao.insertPaymentDetail(conn, pd);
		if(result>0)commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	
}
