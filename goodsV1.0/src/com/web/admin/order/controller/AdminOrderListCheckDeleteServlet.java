package com.web.admin.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.admin.order.model.service.AdminOrderListService;

/**
 * Servlet implementation class AdminOrderListCheckDeleteServlet
 */
@WebServlet("/admin/orderCheckDelete")
public class AdminOrderListCheckDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminOrderListCheckDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String[] check=request.getParameterValues("mRowCheck");
		
//		int result=new AdminOrderListService().checkdelete(check);
		
		String msg="";
		String loc="";
//		if(result>0) {
//			msg="주문을 취소하였습니다";
//			loc="/admin/orderList";
//		}else {
//			msg="주문취소를 실패하였습니다";
//			loc="/admin/orderList";
//		}
		request.getRequestDispatcher("/views/client/notice/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
