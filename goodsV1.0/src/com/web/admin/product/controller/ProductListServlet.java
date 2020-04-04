package com.web.admin.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.admin.product.service.AdminProductService;
import com.web.product.model.vo.Product;

@WebServlet("/admin/ProductListView")

public class ProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProductListServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//상품전체 목록 조회하기

		int cPage; // 현재페이지

		// 현재페이지를 선택안했을 수도 있기 때문에 예외처리해준다
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
			cPage = 1;
		}

		// 한페이지에 보여지고싶은 글 개수
		int numPerPage;

		try {
			numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
		} catch (NumberFormatException e) {
			numPerPage = 5;
		}

		// 페이징처리해서 데이터 가져오기
		List<Product> list = new AdminProductService().productList(cPage, numPerPage);

		// 페이지바 만들기

		//총 상품개수 구해오기
		int totalProduct = new AdminProductService().productCount();
		

		// pageBar의 시작번호, 끝번호까지 출력해주는 변수
		// 현재 페이지 : 1 ~ 5 -> 1
		// 현재 페이지 : 6 ~ 10 -> 6
		// 현재 페이지 : 11 ~ 15 -> 11
		int totalPage = (int) Math.ceil((double) totalProduct / numPerPage);


		int pageBarSize = 5; // 밑에 바는 5개씩만 보여준다

		// pageBar의 시작번호, 끝번호까지 출력해주는 변수
		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;

		String pageBar = "";

		// [<]버튼 만들기
		if (pageNo == 1) {
			pageBar += "<span><</span>";
		} else {			       
			pageBar += "<a href='" + request.getContextPath() + "/admin/ProductListView?cPage=" + (pageNo - 1) + "&numPerPage="
					+ numPerPage + "'><</a>";
		}

		// 1 2 3 4 5
		// 5보다 크거나 10페이지보다 크지 않을때
		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage) {
				pageBar += "<span class='cPage'>" + pageNo + "</span>";
			} else {
				pageBar += "<a href='" + request.getContextPath() + "/admin/ProductListView?cPage=" + pageNo + "&numPerPage="
						+ numPerPage + "'>" + pageNo + "</a>";
			}
			pageNo++;
		}
		

		// [>]
		if (pageNo > totalPage) {
			pageBar += "<span>></span>";
		} else {
			pageBar += "<a href='" + request.getContextPath() + "/admin/ProductListView?cPage=" + pageNo + "&numPerPage="
					+ numPerPage + "'>></a>";
		}

		request.setAttribute("list", list);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		request.getRequestDispatcher("/views/admin/product/productList.jsp").forward(request, response);
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
