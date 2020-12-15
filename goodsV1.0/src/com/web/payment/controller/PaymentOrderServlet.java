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

import com.web.member.model.vo.Member;
import com.web.payment.model.service.PaymentService;
import com.web.payment.model.vo.Payment;
import com.web.payment.model.vo.PaymentDetail;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Member lm = (Member)request.getSession().getAttribute("loginedMember");
		// 우편번호, 주소, 운송장번호,이메일,결제방법,전화번호
		
		String[] cNo = request.getParameterValues("cNo");// 커스텀번호
		String cNos = String.join(",", cNo); // 1 , 2, 3
		String mNo = String.valueOf(lm.getM_No());
		// String[] pName=request.getParameterValues("pName");//상품 이름
		String[] oQuan = request.getParameterValues("pQuan");// 수량
		String pQuans = String.join(",", oQuan);
		String tPrice = request.getParameter("payAmount");// 총금액
		String oName = request.getParameter("userName");// 주문자 유저이름
		String orderUserPhone1 = request.getParameter("userPhone[0]");// 주문자전화번호
		String orderUserPhone2 = request.getParameter("userPhone[1]");// 주문자전화번호
		String orderUserPhone3 = request.getParameter("userPhone[2]");// 주문자전화번호
		String oPhone = orderUserPhone1 + "-" + orderUserPhone2 + "-" + orderUserPhone3;
		String oEmail = request.getParameter("userEmail");// 주문자이메일
		String rName = request.getParameter("userName2");// 받는사람 유저이름
		String receUserPhone1 = request.getParameter("userPhone2[0]");// 받는사람전화번호
		String receUserPhone2 = request.getParameter("userPhone2[1]");// 받는사람전화번호
		String receUserPhone3 = request.getParameter("userPhone2[2]");// 받는사람전화번호
		String rPhone = receUserPhone1 + "-" + receUserPhone2 + "-" + receUserPhone3;
		String rPost = request.getParameter("userPost");// 우편번호
		String rAddr = request.getParameter("userAddr");// 주소
		String rAddrDetail = request.getParameter("detailAddress");// 상세주소
		String rAddress = rAddr + " " + rAddrDetail;
		String payWay = request.getParameter("payChoice");
		if (payWay.equals("card")) {
			payWay = "신용카드";
		} else if (payWay.equals("phone")) {
			payWay = "휴대폰 결제";
		} else if (payWay.equals("trans")) {
			payWay = "실시간 계좌이체";
		} else if (payWay.equals("vbank")) {
			payWay = "가상계좌";
		}

		Payment p = new Payment(0, mNo, null, oName, oPhone, oEmail, rName, rPhone, rAddress, rPost, tPrice, payWay, 0,
				cNos);
		int result = new PaymentService().insertPayment(p);
		int result2 = 0;
		int oNo = 0;
		
		if (result > 0) {			
			oNo = new PaymentService().orderNoPayment(cNos);
			PaymentDetail pd = new PaymentDetail(oNo, cNo, oQuan);
			result2 = new PaymentService().insertPaymentDtail(pd);
			
			if(result2>0) {
				String cartCook = "";
				Cookie[] cookies = request.getCookies(); // null이거나 쿠키배열
				for (Cookie c : cookies) {
					if (c.getName().equals(String.valueOf(lm.getM_No()))) {
						cartCook = c.getValue();
					}
				}

				String[] cartCooks = cartCook.split("\\|");
				List<String> list = new ArrayList(Arrays.asList(cartCooks));
				//System.out.println("최초 쿠키값 리스트 : " + list);
				for (int j = 0; j < list.size(); j++) {
					for (int i = 0; i < cNo.length; i++) {
						if (list.get(j).equals(cNo[i])) {
							// System.out.println("지울 쿠키값(선택된거) : "+cNo[i]);
							list.remove(j);
						}
					}

				}
				list.toArray(cartCooks);

				// System.out.println("리무브된 리스트 값 : "+list);
				// System.out.println("리무브된 리스트 사이즈값 : "+list.size());
				String[] cookList = new String[list.size()];
				String cookL = "";
				for (int i = 0; i < list.size(); i++) {
					cookList[i] = list.get(i);
					// System.out.println("리무브된 리스트 값->배열로 옮긴값 : "+cookList[i]);
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
				request.getRequestDispatcher("/views/client/payment/paymentComplete.jsp").forward(request, response);
			}else {
				request.getRequestDispatcher("/views/client/payment/paymentFail.jsp").forward(request, response);
				
			}

		} else {
			request.getRequestDispatcher("/views/client/payment/paymentFail.jsp").forward(request, response);
	
		}

//		String cartCook = "";
//		Cookie[] cookies = request.getCookies(); // null이거나 쿠키배열
//		for (Cookie c : cookies) {
//			if (c.getName().equals(String.valueOf(lm.getM_No()))) {
//				cartCook = c.getValue();
//			}
//		}
//
//		String[] cartCooks = cartCook.split("\\|");
//		List<String> list = new ArrayList(Arrays.asList(cartCooks));
//		System.out.println("최초 쿠키값 리스트 : " + list);
//		for (int j = 0; j < list.size(); j++) {
//			for (int i = 0; i < cNo.length; i++) {
//				if (list.get(j).equals(cNo[i])) {
//					// System.out.println("지울 쿠키값(선택된거) : "+cNo[i]);
//					list.remove(j);
//				}
//			}
//
//		}
//		list.toArray(cartCooks);
//
//		// System.out.println("리무브된 리스트 값 : "+list);
//		// System.out.println("리무브된 리스트 사이즈값 : "+list.size());
//		String[] cookList = new String[list.size()];
//		String cookL = "";
//		for (int i = 0; i < list.size(); i++) {
//			cookList[i] = list.get(i);
//			// System.out.println("리무브된 리스트 값->배열로 옮긴값 : "+cookList[i]);
//			if (list.size() - 1 == i) {
//				cookL += cookList[i];
//			} else {
//				cookL += cookList[i] + "|";
//			}
//
//		}
//
//		Cookie cookie = null;
//		if (list.size() != 0) {
//			for (int i = 0; i < cookies.length; i++) {
//				if (cookies[i].getName().equals(String.valueOf(lm.getM_No()))) {
//					cookie = new Cookie(String.valueOf(lm.getM_No()), cookL);
//					cookie.setPath("/");
//					cookie.setMaxAge(60 * 60 * 24 * 90);
//					response.addCookie(cookie);
//				}
//
//			}
//		} else {
//			for (int i = 0; i < cookies.length; i++) {
//				if (cookies[i].getName().equals(String.valueOf(lm.getM_No()))) {
//					cookie = new Cookie(String.valueOf(lm.getM_No()), "");
//					cookie.setPath("/");
//					cookie.setMaxAge(0);
//					response.addCookie(cookie);
//				}
//
//			}
//		}
//		request.getRequestDispatcher("/views/client/payment/paymentComplete.jsp").forward(request, response);

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
