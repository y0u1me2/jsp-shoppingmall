package com.web.admin.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.admin.order.model.service.AdminOrderListService;

/**
 * Servlet implementation class AdminOrderListDeleteServlet
 */
@WebServlet("/admin/orderListDelete")
public class AdminOrderListDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminOrderListDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int no=Integer.parseInt(request.getParameter("no"));
		String type=request.getParameter("searchType");
		String keyword=request.getParameter("searchKeyword");
		int result=new AdminOrderListService().deleteOrderList(no);
		
		String msg=" ";
		if(type.length()>0) {
			if(result>0) {
				msg="주문내역을 삭제 하였습니다.";
				request.setAttribute("msg", msg);
				request.setAttribute("loc", "/admin/orderFinder?searchType="+type+"&searchKeyword="+keyword);
				request.getRequestDispatcher("/views/admin/notice/msg.jsp").forward(request, response);
			}else {
				msg="주문내역 삭제를 실패하였습니다.";
				request.setAttribute("msg", msg);
				request.setAttribute("loc", "/admin/orderFinder?searchType="+type+"&searchKeyword="+keyword);
				request.getRequestDispatcher("/views/admin/notice/msg.jsp").forward(request, response);
			}
		}else {
			if(result>0) {
				msg="주문내역을 삭제 하였습니다.";
				request.setAttribute("msg", msg);
				request.setAttribute("loc", "/admin/orderList");
				request.getRequestDispatcher("/views/admin/notice/msg.jsp").forward(request, response);
			}else {
				msg="주문내역 삭제를 실패하였습니다.";
				request.setAttribute("msg", msg);
				request.setAttribute("loc", "/admin/orderList");
				request.getRequestDispatcher("/views/admin/notice/msg.jsp").forward(request, response);
			}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
