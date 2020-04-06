package com.web.admin.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/admin/productEnroll")
public class ProductEnrollViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ProductEnrollViewServlet() {
        super();
      
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//상품등록 페이지로 이동하기
		
		request.getRequestDispatcher("/views/admin/product/productEnroll.jsp")
		.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
