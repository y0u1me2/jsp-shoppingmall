package com.web.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.notice.model.service.NoticeService;
import com.web.notice.model.vo.NoticeComment;

/**
 * Servlet implementation class NoticeCommentServlet
 */
@WebServlet("/notice/noticeComment")
public class NoticeCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String content=request.getParameter("commentContent");
		int nNo=Integer.parseInt(request.getParameter("noticeNo"));
		int mNo=Integer.parseInt(request.getParameter("commentWriter"));
		int level=Integer.parseInt(request.getParameter("commentLevel"));
		int ncNo=Integer.parseInt(request.getParameter("commentNo"));
		
		NoticeComment nc=new NoticeComment(0,mNo,nNo,level,content,ncNo,null,null);
		
		int result=new NoticeService().insertComment(nc);
		String msg=result>0?"댓글등록 성공!":"댓글 등록실패";
		String loc="/notice/noticeView?nNo="+nNo;
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/admin/notice/msg.jsp")
		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
