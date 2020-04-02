package com.web.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.notice.model.service.NoticeService;

/**
 * Servlet implementation class NoticeCheckDeleteServlet
 */
@WebServlet("/admin/allDelete")
public class NoticeCheckDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeCheckDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String[] check=request.getParameterValues("mRowCheck");
		String type=request.getParameter("type");
		String keyword=request.getParameter("keyword");
		
		int count=new NoticeService().checkDelete(check);
		String msg=" ";
		if(type!=null&&type.length()>0) {
			if(count>0) {
				msg="삭제 성공";
				request.setAttribute("msg", msg);
				request.setAttribute("loc", "/admin/noticeFinder?searchType="+type+"&searchKeyword="+keyword);
				request.getRequestDispatcher("/views/client/notice/msg.jsp").forward(request, response);
			}else {
				msg="삭제 실패";
				request.setAttribute("msg", msg);
				request.setAttribute("loc", "/admin/noticeFinder?searchType="+type+"&searchKeyword="+keyword);
				request.getRequestDispatcher("/views/client/notice/msg.jsp").forward(request, response);
			}
		}else {
			if(count>0) {
				msg="삭제 성공";
				request.setAttribute("msg", msg);
				request.setAttribute("loc", "/admin/noticeList");
				request.getRequestDispatcher("/views/client/notice/msg.jsp").forward(request, response);
			}else {
				msg="삭제 실패";
				request.setAttribute("msg", msg);
				request.setAttribute("loc", "/admin/noticeList");
				request.getRequestDispatcher("/views/client/notice/msg.jsp").forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
