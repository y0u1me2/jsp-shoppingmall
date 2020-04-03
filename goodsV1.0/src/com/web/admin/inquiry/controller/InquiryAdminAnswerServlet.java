package com.web.admin.inquiry.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.admin.inquiry.model.service.AdminInquiryService;
import com.web.admin.inquiry.model.vo.InquiryAnswer;

@WebServlet("/InquiryAdminAnswer")
public class InquiryAdminAnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InquiryAdminAnswerServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1:1문의답변한 상세페이지로 이동하기

		// 사용자가 문의한 글번호를 가져온다
		int no = Integer.parseInt(request.getParameter("ino"));

		InquiryAnswer ia = new AdminInquiryService().selectInquiryAnswer(no);

		// ia가 null이면 요청하신 내역이 없습니다. 메세지를 출력하고 문의내역리스트 페이지로 전환
		if (ia == null) {
			request.setAttribute("msg", "요청하신 내역이 없습니다.");
			request.setAttribute("loc", "/InquiryList");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);

		// ia가 값이 있으면 답변한 페이지로 전환
		} else {
			request.setAttribute("ia", ia);
			request.getRequestDispatcher("/views/admin/inquiry/completedAdminAnswerDetail.jsp").forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
