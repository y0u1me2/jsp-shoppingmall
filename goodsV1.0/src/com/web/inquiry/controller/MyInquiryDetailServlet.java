package com.web.inquiry.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web.inquiry.model.service.InquiryService;
import com.web.inquiry.model.vo.Inquiry;



@WebServlet("/myInquiryDetail")
public class MyInquiryDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public MyInquiryDetailServlet() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//주소창에 서블릿 매핑값 적었을때 접속을 차단하는 방법
				// * 로그인을 하지 않았을때 
				HttpSession session = request.getSession(false);
				if(session!=null && session.getAttribute("loginedMember")==null) {
					request.setAttribute("msg", "잘못된 접근입니다. 메인화면으로 이동합니다.");
					request.setAttribute("loc", "/");
					request.getRequestDispatcher("/views/client/common/msg.jsp").forward(request,response);
				}
				else { //로그인한 아이디가 있으면 
		//1:1문의내역 상세페이지
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println(no);
		
		Inquiry i = new InquiryService().selectInquiry(no);
		System.out.println(i);
		//n이 null이면 요청하신 문의가 없습니다. 메세지를 출력하고 문의내역리스트 페이지로 전환
		//n이 값이 있으면 상세페이지로 전환
		
		if(i==null) {
			request.setAttribute("msg", "요청하신 문의가 없습니다.");
			request.setAttribute("loc","/myInquiryList" );
			
			request.getRequestDispatcher("/views/client/common/msg.jsp")
			.forward(request, response);
		}else {
			request.setAttribute("i", i);
			request.getRequestDispatcher("/views/client/mypage/inquiry/myInquiryDetail.jsp")
			.forward(request, response);
		}
	}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
