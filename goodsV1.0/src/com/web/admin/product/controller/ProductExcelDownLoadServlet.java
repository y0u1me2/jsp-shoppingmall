package com.web.admin.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.admin.product.service.AdminProductService;
import com.web.product.model.vo.Product;


@WebServlet("/productExcelDownLoad")
public class ProductExcelDownLoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ProductExcelDownLoadServlet() {
        super();
     
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Product> list = new AdminProductService().excelDownLoad();
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/views/admin/product/productListExcel.jsp")
		.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
