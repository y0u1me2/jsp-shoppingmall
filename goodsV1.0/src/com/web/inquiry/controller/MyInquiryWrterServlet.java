package com.web.inquiry.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/MyInquiryWrite")
public class MyInquiryWrterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MyInquiryWrterServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1:1문의내역 페이지로 이동
		request.getRequestDispatcher("/views/client/mypage/inquiry/inquirySend.jsp")
		.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
