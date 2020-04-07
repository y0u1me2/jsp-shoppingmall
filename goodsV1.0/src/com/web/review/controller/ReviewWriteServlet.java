package com.web.review.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.web.notice.model.service.NoticeService;
import com.web.review.model.service.ReviewService;
import com.web.review.model.vo.Review;

/**
 * Servlet implementation class ReviewWriteServlet
 */
@WebServlet("/reviewWrite")
public class ReviewWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//경로설정
		String path=getServletContext().getRealPath("/upload/review");
		int maxSize=1024*1024*10; //10MB;
		MultipartRequest mr=new MultipartRequest(request, path, maxSize, "UTF-8",new DefaultFileRenamePolicy());
		
		int starPoint=Integer.parseInt(mr.getParameter("starPoint"));
		String content=mr.getParameter("content");		
		String up_file=mr.getParameter("up_file");
		int mNo=Integer.parseInt(mr.getParameter("mNo"));
		int cNo=Integer.parseInt(mr.getParameter("cNo"));
		
		
		Enumeration f=mr.getFileNames();
		String oriFileName="";
		String reNameFile="";
		while(f.hasMoreElements()) {
			String name=(String)f.nextElement();
			reNameFile+=mr.getFilesystemName(name);
			oriFileName+=mr.getOriginalFileName(name);
			System.out.println(reNameFile);
			System.out.println(oriFileName);
		}
		
		Review r=new Review(mNo, cNo, content, starPoint, oriFileName, reNameFile);
		int result=new ReviewService().insertReview(r);
		String msg="";
		String loc="/myReviewList";
		if(result>0) {
			//성공
			msg="리뷰 작성을 완료하였습니다.";
		}else {
			//실패
			msg="리뷰 작성을 실패하였습니다.";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/client/common/msg.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
