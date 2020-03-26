package com.web.inquiry.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.admin.inquiry.model.vo.InquiryAnswer;
import com.web.inquiry.model.service.InquiryService;

@WebServlet("/answerDetail")
public class AnswerDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AnswerDetailServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1:1문의답변 상세페이지
		// DB에서 정보를 가져온다
		
		//문의글번호를 가져온다
		int no = Integer.parseInt(request.getParameter("no"));
	
		InquiryAnswer ia = new InquiryService().selectInquiryAnswer(no);
	
		// ia가 null이면 요청하신 내역이 없습니다. 메세지를 출력하고 문의내역리스트 페이지로 전환
		if (ia == null) {
			request.setAttribute("msg", "확인중 입니다. 빠른 시일 내에 답변 드리겠습니다.");
			request.setAttribute("loc", "/myInquiryList");
			request.getRequestDispatcher("/views/client/common/msg.jsp").forward(request, response);

			// ia가 값이 있으면 상세페이지로 전환
		} else {
			request.setAttribute("ia", ia);
			request.getRequestDispatcher("/views/client/inquiry/completedAnswerDetail.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
