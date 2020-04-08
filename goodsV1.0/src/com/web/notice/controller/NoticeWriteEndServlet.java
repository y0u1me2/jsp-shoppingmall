package com.web.notice.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.web.notice.model.service.NoticeService;
import com.web.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeWriteEndServlet
 */
@WebServlet("/admin/noticeWriteEnd")
public class NoticeWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeWriteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//파일이 multipart로 넘어왔는지 확인
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "공지사항등록에러!![form:enctype 관리자에게 문의]");
			request.setAttribute("loc", "/notice/noticeWrite");
			request.getRequestDispatcher("/views/admin/notice/msg.jsp").forward(request,response);
		}
		
		//경로
		String path=getServletContext().getRealPath("/upload/notice/");
		int maxSize=1024*1024*10; //10MB;
		MultipartRequest mr=new MultipartRequest(request, path, maxSize, "UTF-8",new DefaultFileRenamePolicy());
		String title=mr.getParameter("title");
		String writer=mr.getParameter("writer");
		String content=mr.getParameter("content");
		Enumeration f=mr.getFileNames();
		String oriFileName="";
		String reNameFile="";
		while(f.hasMoreElements()) {
			String name=(String)f.nextElement();
			reNameFile+=mr.getFilesystemName(name)+",";
			oriFileName+=mr.getOriginalFileName(name)+",";
		}
		Notice n=new Notice(0,writer,title,content,oriFileName,reNameFile,null,0,null);
		int result=new NoticeService().insertNotice(n);
		String msg="";
		String loc="";
		if(result>0) {
			//성공
			msg="공지사항 작성을 완료하였습니다.";
			loc="/admin/noticeList";
		}else {
			//실패
			msg="공지사항 작성을 실패하였습니다.";
			loc="/admin/noticeWrite";
		}
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
