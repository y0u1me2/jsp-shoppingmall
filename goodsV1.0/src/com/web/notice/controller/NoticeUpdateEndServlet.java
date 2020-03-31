package com.web.notice.controller;

import java.io.File;
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
 * Servlet implementation class NoticeUpdateEndServlet
 */
@WebServlet("/admin/noticeUpdateEnd")
public class NoticeUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateEndServlet() {
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
				request.getRequestDispatcher("/views/notice/msg.jsp").forward(request,response);
			}
				
			//경로
			String path=getServletContext().getRealPath("/upload/notice/");
			//최대용량
			int maxSize=1024*1024*10; //10MB;
			//파일 업로드 객체 생성
			MultipartRequest mr=new MultipartRequest(request, path, maxSize, "UTF-8",new DefaultFileRenamePolicy());
			int no=Integer.parseInt(mr.getParameter("no"));
			String title=mr.getParameter("title");
			String writer=mr.getParameter("writer");
			String content=mr.getParameter("content");
			Enumeration f=mr.getFileNames();
			String oriFileName="";
			String reNameFile="";
			while(f.hasMoreElements()) {
				String name=(String)f.nextElement();
				reNameFile+=mr.getFilesystemName(name)+" ";
				oriFileName+=mr.getOriginalFileName(name)+" ";
			}
			Notice n=new Notice(no,writer,title,content,oriFileName,reNameFile,null,0,null);
			//클라이언트가 파일을 수정했는지에따라 분기문 처리
			File fl=mr.getFile("upfile");//클라이언트가 넘긴 파일이 있는지 없는지 확인가능
			System.out.println(mr.getParameter("upfile"));
			String orifile=mr.getParameter("oriFile");
			String[] arr=orifile.split(",");
			if(fl!=null&&fl.exists()) {
				for(String s : arr) {
					System.out.println(s);
					File deleteFile=new File(path+s);
					deleteFile.delete();
				}
			}else {
				System.out.println("왜 이프문으로 안들어가니");
				n.setnOriginalFile(mr.getParameter("oriFile"));
				n.setnRenamedFile(mr.getParameter("reFile"));
			}
			
//			int result=new NoticeService().updateNotice(n);
			
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
