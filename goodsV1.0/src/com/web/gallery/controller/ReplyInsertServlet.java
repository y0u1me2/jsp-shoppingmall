package com.web.gallery.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.gallery.model.service.GalleryService;
import com.web.gallery.model.vo.Reply;

/**
 * Servlet implementation class ReplyInsertServlet
 */
@WebServlet("/gallery/replyInsert")
public class ReplyInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int gNo = Integer.parseInt(request.getParameter("gNo"));
		int mNo = Integer.parseInt(request.getParameter("mNo"));
		String content = request.getParameter("content");
		
		Reply reply = new Reply(0, gNo, mNo, null, content, null);
		
		int result = new GalleryService().insertReply(reply);
		if(result==0) System.out.println("댓글 등록 실패");
//		String msg = result>0?"댓글등록 성공!": "댓글등록 실패";
//		String loc= "/gallery/list";
//		request.setAttribute("msg", msg);
//		request.setAttribute("loc", loc);
//		request.getRequestDispatcher("/views/client/common/msg.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
