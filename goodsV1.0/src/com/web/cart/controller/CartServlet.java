package com.web.cart.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.cart.model.service.CartService;
import com.web.cart.model.vo.Cart;
import com.web.member.model.vo.Member;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Member lm = (Member)request.getSession().getAttribute("loginedMember");
		//쿠키
		String cartCook = "";
		Cookie[] cookies = request.getCookies(); //null이거나 쿠키배열
	
		String [] cart=new String[cookies.length];
		for(Cookie c : cookies) {
			if(String.valueOf(lm.getM_No()).equals(c.getName())) {
				cart = c.getValue().split("\\|");
			}else {
				cart = new String[0];
			}
		}
		
//		if(cookies!=null) {//기존에 쿠키가 있는 경우
//			for(int i=0; i<cookies.length; i++) {
//				if(cookies[i].getName().equals(String.valueOf(lm.getM_No()))) {
//					cart = cookies[i].getValue().split("\\|");
//
//				}
//			}
//		}
		List<Cart> c = new CartService().searchCart(cart); 

		request.setAttribute("cart", c);
		request.getRequestDispatcher("/views/client/cart/cart.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
