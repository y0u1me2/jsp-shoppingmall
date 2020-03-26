package com.web.inquiry.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.inquiry.model.service.InquiryService;

@WebServlet("/myInquiryDelete")
public class MyInquiryDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MyInquiryDeleteServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1:1문의 삭제하기
		// 사용자 에게 지울 대상을 전달받아 DB에 있는 문의를 지우는 로직
		// 로그인한 아이디 히든으로 가져오기
		
		//String id = request.getParameter("userId_ck");
		
		//HttpSession session = request.getSession();
		//System.out.println(session.getAttribute("loginedMember"));
		
		// 글번호 가져오기
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println(no);
		
		int result = new InquiryService().deleteInquiry(no);

		String msg = "";
		String loc = "";

		if (result > 0) {
			msg = "문의하신 글이 삭제되었습니다.";
			loc = "/myInquiryList"; // 삭제 완료되면 문의목록페이지로 이동

		} else {
			msg = "실패하였습니다. 다시 시도 바랍니다.";
			loc = "/myInquiryDetail"; //삭제 실패하면 상세페이지로 다시 이동
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);

		request.getRequestDispatcher("/views/client/common/msg.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
