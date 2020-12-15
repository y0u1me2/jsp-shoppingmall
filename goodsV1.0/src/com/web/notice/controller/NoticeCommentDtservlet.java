package com.web.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.notice.model.service.NoticeService;

/**
 * Servlet implementation class NoticeCommentDtservlet
 */
@WebServlet("/notice/noticeCommentDt")
public class NoticeCommentDtservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeCommentDtservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int ncNo=Integer.parseInt(request.getParameter("ncNo"));
		int nNo=Integer.parseInt(request.getParameter("nNo"));
		int result=new NoticeService().commentDt(ncNo);
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="댓글을 삭제하였습니다";
			loc="/notice/noticeView?nNo="+nNo;
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/admin/notice/msg.jsp").forward(request, response);
		}else {
			msg="댓글삭제를 실패하였습니다";
			loc="/notice/noticeView?nNo="+nNo;
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/admin/notice/msg.jsp").forward(request, response);
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
