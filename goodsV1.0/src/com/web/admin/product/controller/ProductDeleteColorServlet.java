package com.web.admin.product.controller;

import java.io.IOException;
import java.util.LinkedHashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.admin.product.service.AdminProductService;
import com.web.product.model.vo.Product;

@WebServlet("/admin/productDeleteColor")
public class ProductDeleteColorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProductDeleteColorServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//색상삭제화면으로 이동
		int no = Integer.parseInt(request.getParameter("no"));
		
		LinkedHashMap<String, String> images  = new AdminProductService().SearchProductNo(no);
		
		request.setAttribute("images", images);
		
		request.setAttribute("no", no);
		request.getRequestDispatcher("/views/admin/product/productDeleteColor.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
