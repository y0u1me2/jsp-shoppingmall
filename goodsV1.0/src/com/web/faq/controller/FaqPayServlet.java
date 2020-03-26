package com.web.faq.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.faq.model.service.FAQService;
import com.web.faq.model.vo.FAQ;

/**
 * Servlet implementation class FaqPayServlet
 */
@WebServlet("/faqPay")
public class FaqPayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqPayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		int no=Integer.parseInt(request.getParameter("no"));
		String cg=request.getParameter("cg");
		List<FAQ> list= new FAQService().selectCategory(cg);
		System.out.println(list.toString());
		request.setAttribute("faq", list);
           		
		request.getRequestDispatcher("/views/client/ServiceCenter/Faqmember.jsp").forward(request, response);
//		private FAQService fser=new FAQService();
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
