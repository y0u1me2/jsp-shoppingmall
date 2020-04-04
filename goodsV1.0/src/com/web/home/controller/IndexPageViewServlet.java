package com.web.home.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.product.model.service.ProductService;
import com.web.product.model.vo.Product;

/**
 * Servlet implementation class IndexPageViewServlet
 */
@WebServlet("/home")
public class IndexPageViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexPageViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		List<Product> 케이스 = new ProductService().selectByCategory("케이스");
		List<Product> 악세사리 = new ProductService().selectByCategory("악세사리");
		List<Product> 생활용품 = new ProductService().selectByCategory("생활용품");
		List<Product> 패션 = new ProductService().selectByCategory("패션");
		
		request.setAttribute("케이스", 케이스);
		request.setAttribute("악세사리", 악세사리);
		request.setAttribute("생활용품", 생활용품);
		request.setAttribute("패션", 패션);
		
		request.getRequestDispatcher("/views/client/home.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
