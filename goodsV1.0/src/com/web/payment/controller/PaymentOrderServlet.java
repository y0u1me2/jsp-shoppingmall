package com.web.payment.controller;

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

/**
 * Servlet implementation class PaymentOrderServlet
 */
@WebServlet("/payment/paymentOrder")
public class PaymentOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 우편번호, 주소, 운송장번호,이메일,결제방법,전화번호
		String[] cNo=request.getParameterValues("cNo");//커스텀번호
		//String[] pName=request.getParameterValues("pName");//상품 이름
		String[] pQuan=request.getParameterValues("pQuan");//수량
		String tPrice=request.getParameter("totalPrice");//총금액
		String orderUserName=request.getParameter("userName");//주문자 유저이름
		String orderUserPhone1=request.getParameter("userPhone[0]");//주문자전화번호
		String orderUserPhone2=request.getParameter("userPhone[1]");//주문자전화번호
		String orderUserPhone3=request.getParameter("userPhone[2]");//주문자전화번호
		String orderEmail=request.getParameter("userEmail");//주문자이메일
		String receUserName=request.getParameter("userName2");//받는사람 유저이름
		String receUserPhone1=request.getParameter("userPhone2[0]");//받는사람전화번호
		String receUserPhone2=request.getParameter("userPhone2[1]");//받는사람전화번호
		String receUserPhone3=request.getParameter("userPhone2[2]");//받는사람전화번호
		String receUserPost=request.getParameter("userPost");//우편번호
		String receUserAddr=request.getParameter("userAddr");//주소
		String receUserAddrDetail=request.getParameter("detailAddress");//상세주소
		String payWay = request.getParameter("payChoice");
		
		for(int i=0;i<cNo.length;i++) {
			System.out.println(i+"번째커스텀번호 : "+cNo[i]);
			System.out.println(i+"번째수량: "+pQuan[i]);
		}
		System.out.println("총 금액 : "+tPrice);
		System.out.println("주문자 이름 : "+orderUserName);
		System.out.println("주문자 전화번호 : "+orderUserPhone1+"-"+orderUserPhone2+"-"+orderUserPhone3);
		System.out.println("주문자 이메일 : "+orderEmail);
		System.out.println("받는사람 이람 : "+receUserName);
		System.out.println("받는사람 전화번호 : "+receUserPhone1+"-"+receUserPhone2+"-"+receUserPhone3);
		System.out.println("우편번호 : "+receUserPost);
		System.out.println("주소 : "+receUserAddr);
		System.out.println("상세주소 : "+receUserAddrDetail);
		System.out.println("결제방법 : "+payWay);
		
		String cartCook = "";
		Cookie[] cookies = request.getCookies(); //null이거나 쿠키배열
		for(Cookie c : cookies) {
			if(c.getName().equals("cart")) {
				cartCook=c.getValue();
			}
		}
		
		String[] cartCooks=cartCook.split("\\|");
		List<String> list = new ArrayList(Arrays.asList(cartCooks));
		System.out.println(list);
		for(int j=0;j<list.size();j++) {
			for(int i=0;i<cNo.length;i++)
			if(list.get(j).equals(cNo[i])) {
				System.out.println(cNo[i]);
				list.remove(j);
			}
		}
		list.toArray(cartCooks);
		
		System.out.println(list);
		/*
		 * String cookieVal=""; for(int i=0;i<cartCooks.length;i++) { if(i!=0)
		 * cookieVal+="|"; cookieVal+=cartCooks[i]; }
		 */
		Cookie cookie = null;
		if(cookies !=null) {
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals("cart")) {
				cookie = new Cookie("cart",String.join("|", cartCooks).replace("|null", ""));
				cookie.setPath("/");
				cookie.setMaxAge(60*60*24*90);
				response.addCookie(cookie);
				}
			}
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
