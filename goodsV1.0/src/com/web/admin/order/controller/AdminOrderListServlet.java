package com.web.admin.order.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.admin.order.model.service.AdminOrderListService;
import com.web.admin.order.model.vo.OrderList;

/**
 * Servlet implementation class AdminOrderListServlet
 */
@WebServlet("/admin/orderList")
public class AdminOrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminOrderListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		
		int numPerPage;
		try {
			numPerPage=Integer.parseInt(request.getParameter("numPerPage"));
		}catch(NumberFormatException e) {
			numPerPage=5;
		}
		
		List<OrderList> list=new AdminOrderListService().selectOrderList(cPage,numPerPage);
		int totalDate=new AdminOrderListService().amountOrderList();
		int finderDate=new AdminOrderListService().amountOrderList();
		int totalPage=(int)Math.ceil((double)totalDate/numPerPage);
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		String pageBar="";
		
		if(pageNo==1) {
			pageBar+="<span><</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/admin/orderList?cPage="+(pageNo-1)+"&numPerPage="+numPerPage+"'><</a> ";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<span class='cPage'>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()+"/admin/orderList?cPage="+pageNo+"&numPerPage="+numPerPage+"'>"+pageNo+"</a> ";
			}
			pageNo++;
		}
		

		//다음
		if(pageNo>totalPage) {
			pageBar+="<span>></span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/admin/orderList?cPage="+pageNo+"&numPerPage="+numPerPage+"'>></a>";
		}
		
		request.setAttribute("finderDate", finderDate);
		request.setAttribute("totalDate", totalDate);
		request.setAttribute("list", list);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		request.setAttribute("numPerPage", numPerPage);
		request.getRequestDispatcher("/views/admin/order/orderList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
