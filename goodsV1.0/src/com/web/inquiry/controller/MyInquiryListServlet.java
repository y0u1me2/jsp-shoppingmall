package com.web.inquiry.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.inquiry.model.service.InquiryService;
import com.web.inquiry.model.vo.Inquiry;


@WebServlet("/myInquiryList")
public class MyInquiryListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MyInquiryListServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1:1문의사항 페이징처리

		int cPage;

		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
			cPage = 1;
		}

		int numPerPage;

		try {
			numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
		} catch (NumberFormatException e) {
			numPerPage = 5;
		}

		// 내가문의한 데이터 가져오기
		List<Inquiry> list = new InquiryService().searchInquiry(cPage, numPerPage);

		// 페이지바 만들기
		int totalInquiry = new InquiryService().inquiryCount();

		int totalPage = (int) Math.ceil((double) totalInquiry / numPerPage);

		int pageBarSize = 5; // 밑에 바는 5개씩만 보여준다

		// pageBar의 시작번호, 끝번호까지 출력해주는 변수
		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;

		String pageBar = "";

		/*
		 * // [이전] if (pageNo == 1) { pageBar += "<span>[이전]<span>&nbsp"; } else {
		 * pageBar += "<a href=' " + request.getContextPath() + "/myInquiryList?cPage="
		 * + (pageNo - 1) + " '>[이전]</a>&nbsp"; }
		 * 
		 * // 1 2 3 4 5 while (!(pageNo > pageEnd || pageNo > totalPage)) {
		 * 
		 * if (pageNo == cPage) { pageBar += "<span>" + pageNo + "</span>&nbsp"; } else
		 * { pageBar += "<a href='" + request.getContextPath() + "/myInquiryList?cPage="
		 * + pageNo + "&numPerPage=numPerPage'>" + pageNo + "</a>&nbsp"; } pageNo++; }
		 * 
		 * // [다음] if (pageNo > totalPage) { pageBar += "<span>[다음]</span>&nbsp"; } else
		 * { pageBar += "<a href='" + request.getContextPath() + "/myInquiryList?cPage="
		 * + pageNo + "'>[다음]</a>"; }
		 */

		// 조회기간 별로 리스트 출력하기===========================================
		// [이전] 1 2 3 4 5 [다음]

		// [이전]버튼 만들기
		if (pageNo == 1) {
			pageBar += "<span><</span>&nbsp";
		} else {
//	         pageBar+=""<a href=' " + request.getContextPath() + "/myInquiryList?cPage="+ (pageNo - 1) + " '>[이전]</a>&nbsp";
			pageBar += "<a href='" + request.getContextPath() + "/myInquiryList?cPage=" + (pageNo - 1) + "&numPerPage="
					+ numPerPage + "'><</a>&nbsp ";
		}

		// 1 2 3 4 5
		// 5보다 크거나 10페이지보다 크지 않을때
		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage) {
				pageBar += "<span class='cPage'>" + pageNo + "</span>&nbsp";
			} else {
//	            pageBar+="<a href='"+request.getContextPath()+"/myInquiryList?cPage="+pageNo+"&numPerPage=numPerPage'>"+pageNo+"</a>";
				pageBar += "<a href='" + request.getContextPath() + "/myInquiryList?cPage=" + pageNo + "&numPerPage="
						+ numPerPage + "'>" + pageNo + "</a>&nbsp ";
			}
			pageNo++;
		}

		// [다음]
		if (pageNo > totalPage) {
			pageBar += "<span>></span>&nbsp";
		} else {
//	         pageBar+="<a href='"+request.getContextPath()+"/myInquiryList?cPage="+pageNo+"'>[다음]</a>";
			pageBar += "<a href='" + request.getContextPath() + "/myInquiryList?cPage=" + pageNo + "&numPerPage="
					+ numPerPage + "'>></a>&nbsp ";
		}

		request.setAttribute("list", list);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		request.getRequestDispatcher("/views/client/mypage/inquiry/myInquiry.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
