package com.web.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.gallery.model.service.GalleryService;

/**
 * Servlet implementation class OrderProductGallery
 */
@WebServlet("/orderGallery")
public class OrderProductGallery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderProductGallery() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//System.out.println("확인"+Integer.parseInt(request.getParameter("no")));
		int cno = Integer.parseInt(request.getParameter("no"));
		int result = new GalleryService().insertNewGallery(cno);//갤러리 등록
		System.out.println(result);
		if(result>0) {		
			response.setContentType("text/html; charset=UTF-8"); 
			response.getWriter().write("<script>alert('갤러리에 등록되었습니다.'); location.replace('"+request.getContextPath()+"/gallery/list');</script>");
		}else { 
			response.setContentType("text/html; charset=UTF-8"); 
			response.getWriter().write("<script>alert('갤러리 등록에 실패하였습니다. 관리자에게 문의하세요.'); history.back();</script>");
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
