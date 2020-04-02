package com.web.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.notice.model.service.NoticeService;
import com.web.notice.model.vo.Notice;
import com.web.notice.model.vo.NoticeComment;

/**
 * Servlet implementation class NoticeViewServlet
 */
@WebServlet("/notice/noticeView")
public class NoticeViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int nNo=Integer.parseInt(request.getParameter("nNo"));
		
		//쿠키가져와서 검사하기
		Cookie[] cookies=request.getCookies();
		String val="";
		boolean hasRead=false;
		
		//쿠키가 있는지 없는지 확인(읽었는지 안읽었는지)
		if(cookies!=null) {
			for(Cookie c : cookies) {
				String name=c.getName();
				String v=c.getValue();
				if("noticeView".equals(name)) {
					val=v;
					if(v.contains("|"+nNo+"|")) {
						hasRead=true;
						break;
					}
				}
			}
		}
		//안읽엇으면
		if(!hasRead) {
			Cookie c=new Cookie("noticeView","|"+nNo+"|");
			c.setMaxAge(-1);
			response.addCookie(c);
		}
		
		Notice n=new NoticeService().oneNotice(nNo,hasRead);
		
		List<NoticeComment> list=new NoticeService().selectComment(nNo);
		
		request.setAttribute("list", list);
		request.setAttribute("notice",n);
		request.getRequestDispatcher("/views/client/notice/noticeView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
