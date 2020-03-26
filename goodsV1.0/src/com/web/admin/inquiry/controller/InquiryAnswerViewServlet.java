package com.web.admin.inquiry.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/InquiryAnswerView")
public class InquiryAnswerViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public InquiryAnswerViewServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//답변하기 버튼 누르면 페이지 이동
			
		request.getRequestDispatcher("/views/admin/inquiry/inquiryanswer.jsp")
		.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
