package com.web.profile.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.profile.model.service.ProfileService;

/**
 * Servlet implementation class Profile
 */
@WebServlet(name="profileServlet", urlPatterns ="/profile")
public class Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Profile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("editMember");
		System.out.println(email);
		String pw = request.getParameter("password");//사용자가 입력하는 비밀번호값
		System.out.println("암호화된 비밀번호:"+pw);//암호화됐는지 확인위해 출력테스트 
		
		int result = new ProfileService().pwCheck(email,pw);
		System.out.println(result);
		
		if(result == 1) {
			request.getRequestDispatcher("/views/client/mypage/MemberModify.jsp").forward(request, response);
			System.out.println(result);
		}else {
			//비밀번호가 일치하지 않기 때문에 다시 입력받아야 함
			response.setContentType("text/html; charset=UTF-8"); 
			response.getWriter().write("<script>alert('비밀번호를 잘못 입력하셨습니다.');history.back();</script>");
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
