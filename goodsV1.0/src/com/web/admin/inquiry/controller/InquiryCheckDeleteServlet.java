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

@WebServlet("/inquiryCheckDelete")
public class InquiryCheckDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InquiryCheckDeleteServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		  //선택한 체크박스 문의글 삭제하기
		 
		 //체크박스의 체크된 값을 배열로 받는다. 
		String [] row = request.getParameterValues("rowCheck");
		  
		  // System.out.println(row[0]); // System.out.println(row[1]); // //db에는 배열
		  //자료형이 없으므로 String으로 바꿔줘야함 
		String allChecks = String.join(",",row);
		  
		  System.out.println(Arrays.toString(row));
		  
		  int result = new AdminInquiryService().inquiryCheckDelete(row);
		  
		  if(result>0) { System.out.println("삭제완료"); }
		 
		 
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
