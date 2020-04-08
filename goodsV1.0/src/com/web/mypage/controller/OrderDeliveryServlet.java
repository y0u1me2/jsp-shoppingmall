package com.web.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.gallery.model.service.GalleryService;
import com.web.member.model.vo.Member;
import com.web.mypage.service.OrderDeliveryService;
import com.web.mypage.vo.ODMember;


@WebServlet("/orderDelivery")
public class OrderDeliveryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public OrderDeliveryServlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		//int login2 = Integer.parseInt(request.getParameter("mNo"));
		Member lm = (Member)request.getSession().getAttribute("loginedMember");
		int login = lm.getM_No();
		
//		List<ODMember> list= new GalleryService().statusGallery(login);
//		String[] statuss = new String[list.size()];
		
		List <ODMember> od = new OrderDeliveryService().OrderDeliveryMember(login);
		
		request.setAttribute("od",od);
		request.getRequestDispatcher("/views/client/mypage/OrderInquiry.jsp")
		.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
