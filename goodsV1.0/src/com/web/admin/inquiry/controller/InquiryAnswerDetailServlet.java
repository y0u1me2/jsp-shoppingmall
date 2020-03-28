package com.web.admin.inquiry.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.admin.inquiry.model.service.AdminInquiryService;
import com.web.admin.inquiry.model.vo.InquiryAnswer;
import com.web.inquiry.model.service.InquiryService;
import com.web.inquiry.model.vo.Inquiry;

@WebServlet("/inquiryAnswerDetail")
public class InquiryAnswerDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public InquiryAnswerDetailServlet() {
        super();
      
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//사용자가 1:1문의보낸 내용 상세페이지로 이동하기
		
		//사용자가 문의한 글번호를 가져온다
		int no = Integer.parseInt(request.getParameter("no"));

		Inquiry i = new AdminInquiryService().selectInquiry(no);

		// i가 null이면 요청하신 내역이 없습니다. 메세지를 출력하고 문의 목록리스트 페이지로 전환
		if (i == null) {
		request.setAttribute("msg", "요청하신 내역이 없습니다.");
		request.setAttribute("loc", "/InquiryList");

		request.getRequestDispatcher("/views/client/common/msg.jsp").forward(request, response);

		// i가 값이 있으면 상세페이지로 전환
		} else {
			request.setAttribute("i", i);
			request.getRequestDispatcher("/views/admin/inquiry/inquiryanswerDetail.jsp")
			.forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
