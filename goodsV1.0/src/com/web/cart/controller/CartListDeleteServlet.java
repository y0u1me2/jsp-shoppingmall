package com.web.cart.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
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
 * Servlet implementation class CartListDeleteServlet
 */
@WebServlet("/cart/cartListDelete")
public class CartListDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartListDeleteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String cNo = request.getParameter("cLDeleteNo");
		System.out.println("삭제할 쿠키 : " + cNo);
		Member lm = (Member)request.getSession().getAttribute("loginedMember");
		String cartCook = "";
		Cookie[] cookies = request.getCookies(); // null이거나 쿠키배열
		for (Cookie c : cookies) {
			if (c.getName().equals(String.valueOf(lm.getM_No()))) {
				cartCook = c.getValue();
			}
		}
		String[] cartCooks = cartCook.split("\\|");
		List<String> list = new ArrayList(Arrays.asList(cartCooks));
		System.out.println("최초 쿠키값 리스트 : " + list);
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).equals(cNo)) {
				System.out.println("지울 쿠키값(선택된거) : " + cNo);
				list.remove(i);
			}
		}
		list.toArray(cartCooks);
		
		if(list.size()>0) {
			if(list.get(0)=="") {
				list.clear();
			}
		}
		
		
		System.out.println("리무브된 리스트 값 : " + list);
		System.out.println("리무브된 리스트 사이즈값 : " + list.size());
		String[] cookList = new String[list.size()];
		String cookL = "";

		for (int i = 0; i < list.size(); i++) {
			cookList[i] = list.get(i);
			System.out.println("리무브된 리스트 값->배열로 옮긴값 : " + cookList[i]);
			if (list.size() - 1 == i) {
				cookL += cookList[i];
			} else {
				cookL += cookList[i] + "|";
			}

		}

		Cookie cookie = null;
		if (list.size() != 0) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals(String.valueOf(lm.getM_No()))) {
					cookie = new Cookie(String.valueOf(lm.getM_No()), cookL);
					cookie.setPath("/");
					cookie.setMaxAge(60 * 60 * 24 * 90);
					response.addCookie(cookie);
				}

			}
		} else {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals(String.valueOf(lm.getM_No()))) {
					cookie = new Cookie(String.valueOf(lm.getM_No()), "");
					cookie.setPath("/");
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}

			}
		}

		List<Cart> c = new CartService().searchCart(cookList);
		request.setAttribute("cart", c);
		request.getRequestDispatcher("/views/client/cart/cart.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
