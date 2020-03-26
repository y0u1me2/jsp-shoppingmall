package com.web.product.controller;

import java.io.IOException;
import java.util.LinkedHashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.product.model.service.ProductService;
import com.web.product.model.vo.Product;

/**
 * Servlet implementation class ProductViewServlet
 */
@WebServlet("/product/view")
public class ProductViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int pNo = Integer.parseInt(request.getParameter("pNo"));
		
		Product p = new ProductService().getProduct(pNo);
		LinkedHashMap<String, String> images = new ProductService().getProductImages(pNo); // 키:값을 '색상':'파일명'으로 매핑
		
		request.setAttribute("product", p);
		request.setAttribute("images", images);
		request.getRequestDispatcher("/views/client/product/productView.jsp").forward(request, response);
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
