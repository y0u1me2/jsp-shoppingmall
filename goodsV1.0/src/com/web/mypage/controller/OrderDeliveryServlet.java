package com.web.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.mypage.service.OrderDeliveryService;
import com.web.mypage.vo.OrderDeliveryMember;


@WebServlet("/orderDelivery")
public class OrderDeliveryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public OrderDeliveryServlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		int login = Integer.parseInt(request.getParameter("mNo"));
		System.out.println(login);
		List <OrderDeliveryMember> od = new OrderDeliveryService().OrderDeliveryMember(login);
		for(OrderDeliveryMember d : od) {
			System.out.println(d);
		}
		request.setAttribute("od",od);
		
		request.getRequestDispatcher("/views/client/mypage/OrderInquiry.jsp")
		.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
