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
import com.web.notice.model.service.NoticeService;

/**
 * Servlet implementation class AdminOrderFinderListServlet
 */
@WebServlet("/admin/orderFinder")
public class AdminOrderFinderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminOrderFinderListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String type=request.getParameter("searchType");
		String keyword=request.getParameter("searchKeyword");
		
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
			numPerPage=10;
		}
		List<OrderList> list = new AdminOrderListService().searchOrderList(cPage,numPerPage,type,keyword);
		//pageBar만들기
		
		
		int totalDate=new AdminOrderListService().amountOrderList();
		int finderDate=new AdminOrderListService().amountOrderList(type,keyword);
		int totalPage=(int)Math.ceil((double)finderDate/numPerPage);
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		System.out.println(finderDate);
		String pageBar="";
		//이전페이지 만들기
		if(pageNo==1) {
			pageBar+="<span><</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/admin/orderFinder?cPage="+(pageNo-1)+"&searchType="+type+"&searchKeyword="+keyword+"&numPerPage="+numPerPage+"'><</a>";
		}																							//타입과 키워드가 유지되게하는 로직
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()+"/admin/orderFinder?cPage="+pageNo+"&searchType="+type+"&searchKeyword="+keyword+"&numPerPage="+numPerPage+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<span>></span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/admin/orderFinder?cPage="+pageNo+"&searchType="+type+"&searchKeyword="+keyword+"&numPerPage="+numPerPage+"'>></a>";
		}
		//총 매출
		int totalPrice=new AdminOrderListService().totalPrice();
		int searchPrice=new AdminOrderListService().totalPrice(type,keyword);
		System.out.println(searchPrice);
		
		request.setAttribute("totalPrice", totalPrice);
		request.setAttribute("searchPrice", searchPrice);
		request.setAttribute("totalDate",totalDate);
		request.setAttribute("finderDate",finderDate);
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
