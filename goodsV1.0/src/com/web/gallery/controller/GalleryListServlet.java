package com.web.gallery.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.gallery.model.service.GalleryService;
import com.web.gallery.model.vo.Gallery;

/**
 * Servlet implementation class GalleryListServlet
 */
@WebServlet("/gallery/list")
public class GalleryListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GalleryListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	    
		String sort = request.getParameter("sort");
		if(sort==null) sort="down_cnt";
		
		String category = request.getParameter("category");
		if(category==null) category = "";
		
		String pName = request.getParameter("pName");
		if(pName==null||pName.equals("전체")) pName = "";
		
		
		// DB에 저장된 문의내역을 페이징처리해서 가져온다
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
			numPerPage = 6;
		}

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("sort", sort);
		map.put("category", category);
		map.put("pName", pName);
		map.put("cPage", cPage);
		map.put("numPerPage", numPerPage);
		
		List<Gallery> list = new GalleryService().getGalleryList(map);

		// 페이지바 만들기
		int totalNum = new GalleryService().totalDataCount(map);

		int totalPage = (int) Math.ceil((double) totalNum / numPerPage);

		int pageBarSize = 5; // 밑에 바는 5개씩만 보여준다

		// pageBar의 시작번호, 끝번호까지 출력해주는 변수
		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;

		String pageBar = "";

		// [<]버튼 만들기
		if (pageNo == 1) {
			pageBar += "<span><</span>";
		} else {			       
			pageBar += "<a href='javascript:void(0);' onclick='ajaxPageMove("+(pageNo - 1)+");'><</a>";
		}

		// 1 2 3 4 5
		// 5보다 크거나 10페이지보다 크지 않을때
		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage) {
				pageBar += "<span class='cPage'>" + pageNo + "</span>";
			} else {
				pageBar += "<a href='javascript:void(0);' onclick='ajaxPageMove("+(pageNo)+");'>" + pageNo + "</a>";
			}
			pageNo++;
		}

		// [>]
		if (pageNo > totalPage) {
			pageBar += "<span>></span>";
		} else {
			pageBar += "<a href='javascript:void(0);' onclick='ajaxPageMove("+(pageNo)+");'>></a>";
		}


		request.setAttribute("list", list);
		request.setAttribute("pageBar", pageBar);
		
		request.getRequestDispatcher("/views/client/gallery/galleryList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
