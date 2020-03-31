package com.web.gallery.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.web.product.model.service.ProductService;
import com.web.product.model.vo.Product;

/**
 * Servlet implementation class AjaxProductListServlet
 */
@WebServlet("/getProductList")
public class AjaxProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxProductListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String category = request.getParameter("category");
		List<Product> list = new ProductService().selectByCategory(category);
		List<String> list2 = new ArrayList<String>();
		
		JSONArray jsonArr = new JSONArray();
		for(Product p : list) {
			jsonArr.add(p.getpName());
		}
		
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(jsonArr); //객체배열 보내기
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
