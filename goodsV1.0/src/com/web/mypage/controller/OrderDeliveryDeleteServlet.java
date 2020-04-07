package com.web.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.mypage.service.OrderDeliveryService;

/**
 * Servlet implementation class OrderDeliveryDeleteServlet
 */
@WebServlet("/orderdelete")
public class OrderDeliveryDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderDeliveryDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int no =Integer.parseInt(request.getParameter("no"));
	
		
		int result = new OrderDeliveryService().orderDelete(no);
		String msg = "";
		String loc = "";
		if(result>0) {
			msg = "주문내역을 삭제하였습니다.";
			loc = "/orderDelivery";
		}else {
			msg = "주문내역 삭제를 실패하였습니다.";
			loc = "/orderDelivery";
	}
		request.setAttribute("msg",msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/admin/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
