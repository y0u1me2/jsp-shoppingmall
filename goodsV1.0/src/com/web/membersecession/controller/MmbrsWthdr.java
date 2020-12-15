package com.web.membersecession.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web.membersecession.service.ModifyPasswordService;

/**
 * Servlet implementation class MmbrsWthdr
 */
@WebServlet(name="mmbrswthdrServlet",urlPatterns="/mmbrswthdr")
public class MmbrsWthdr extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MmbrsWthdr() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("em");
		String pw = request.getParameter("password"); //사용자가 입력하는 비밀번호 값
		
		int result = new ModifyPasswordService().Modifypw(email,pw);
		HttpSession session=request.getSession(false);
		
		if(result>0) {
			//세션이 없으면 가져오지 마라
			if(session!=null) {
				session.invalidate();
			}

			

			request.getRequestDispatcher("/views/client/mypage/Wthdrpage.jsp").forward(request, response);

			
			
		}else { //비밀번호 잘못 입력시 전 페이지로 이동
			response.setContentType("text/html; charset=UTF-8"); 
			response.getWriter().write("<script>alert('비밀번호를 잘못 입력하셨습니다.'); history.back();</script>");
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
