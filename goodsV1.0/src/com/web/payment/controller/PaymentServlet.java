package com.web.payment.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.cart.model.service.CartService;
import com.web.cart.model.vo.Cart;

/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/payment")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("두번??");
		String[] cart = request.getParameterValues("cartSelectF");
		String[] quan = request.getParameterValues("pQuantityF");
		if(cart!=null) {
			List<Cart> c = new CartService().searchCart(cart); 
			
			for(Cart c2 : c) {
				System.out.println(c2);
			}
			request.setAttribute("cart", c);
			request.getRequestDispatcher("/views/client/payment/payment.jsp").forward(request, response);
		}else {
			System.out.println("몇번도냐");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
