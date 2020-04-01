package com.web.admin.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.admin.product.service.AdminProductService;
import com.web.product.model.vo.Product;


@WebServlet("/productUpdateView")
public class ProductUpdateViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public ProductUpdateViewServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//상품정보를 가져와서  수정 화면에 출력해주는 로직
		
		//상품번호를 가져온다
		int no = Integer.parseInt(request.getParameter("pNo"));
		
		System.out.println("수정화면 이동할때 전달? : "+no);
		
		Product p = new AdminProductService().searchProduct(no);
		
		request.setAttribute("product", p);
		
		request.getRequestDispatcher("/views/admin/product/productUpdateView.jsp")
		.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
