package com.web.admin.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.admin.product.service.AdminProductService;

@WebServlet("/productCheckDelete")
public class ProductCheckDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public ProductCheckDeleteServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	String[] pCkDelete = request.getParameterValues("pCkArray[]");
			
		System.out.println(pCkDelete);
		
		int result = new AdminProductService().productCkDelete(pCkDelete);
		
		System.out.println("result값 : "+result);
		
		String msg="";
		String loc="/admin/product/productList";
		
		
		if(result>0) {
			msg="상품이 삭제되었습니다.";			

		}else {
			msg="상품 삭제가 실패하였습니다.";
			
		}
		
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(msg);
		
	}
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
