package com.web.notice.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

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
				request.getRequestDispatcher("/views/admin/notice/msg.jsp").forward(request,response);
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
				reNameFile+=mr.getFilesystemName(name)+",";
				oriFileName+=mr.getOriginalFileName(name)+",";
			}
			Notice n=new Notice(no,writer,title,content,oriFileName,reNameFile,null,0,null);
			//클라이언트가 파일을 수정했는지에따라 분기문 처리
			File fl=mr.getFile("file0");//클라이언트가 넘긴 파일이 있는지 없는지 확인가능
			List<String> list=new ArrayList();
			if(mr.getParameter("oriFile")!=null) {
				int num=mr.getParameter("oriFile").lastIndexOf(",");
				String orifile=mr.getParameter("oriFile").substring(0,num);
				String[] arr=orifile.split(",");
				for(String st : arr) {
					list.add(st);
				}
			}
			String ori=mr.getParameter("oriFile");
			if(fl!=null && fl.length()>0) {
				for(String s : list) {
					File deleteFile=new File(path+s);
					deleteFile.delete();
				}
			}else {
				n.setnOriginalFile(mr.getParameter("oriFile"));
				n.setnRenamedFile(mr.getParameter("reFile"));
			}
			
			
			int result=new NoticeService().updateNotice(n);
			
			String msg="";
			String loc="";
			if(result>0) {
				//성공
				msg="공지사항을 수정하였습니다";
				loc="/admin/noticeList";
			}else {
				//실패
				msg="공지사항 수정을 실패하였습니다.";
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
