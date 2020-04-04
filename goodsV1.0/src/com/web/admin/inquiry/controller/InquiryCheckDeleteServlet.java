package com.web.admin.inquiry.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.admin.inquiry.model.service.AdminInquiryService;
import com.web.admin.member.model.service.AdminMemberService;

@WebServlet("/admin/inquiryCheckDelete")
public class InquiryCheckDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InquiryCheckDeleteServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//사용자가 문의한 글 삭제하기
		
		String[] iCkDelete = request.getParameterValues("iCkArray[]");
			
		int result = new AdminInquiryService().inquiryCkDelete(iCkDelete);
				
		String msg="";
		String loc="/admin/inquiry/inquiryList";
		
		
		if(result>0) {
			msg="1:1 문의글이 삭제되었습니다.";			

		}else {
			msg="1:1 문의글 삭제가 실패하였습니다.";
			
		}
		
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(msg);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
