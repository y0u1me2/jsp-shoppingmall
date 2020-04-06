package com.web.admin.inquiry.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.admin.inquiry.model.service.AdminInquiryService;
import com.web.admin.inquiry.model.vo.InquiryAnswer;


@WebServlet("/admin/InquiryAdminAnswerUpdate")
public class InquiryAdminAnswerUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public InquiryAdminAnswerUpdateServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//답변 수정페이지에 이전 답변내용 출력해주는 로직
		
		//글번호를 가져온다
		int no = Integer.parseInt(request.getParameter("ino"));
				
		InquiryAnswer ia = new AdminInquiryService().inquiryView(no);
				
		request.setAttribute("inquiryAnswer", ia);
				
		request.getRequestDispatcher("/views/admin/inquiry/inquiryAnswerUpdate.jsp")
		.forward(request, response);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
