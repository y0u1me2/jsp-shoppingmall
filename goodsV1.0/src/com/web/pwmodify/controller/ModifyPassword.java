package com.web.pwmodify.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web.pwmodify.service.ModifyPasswordService;

/**
 * Servlet implementation class MODIFY_PASSWORD
 */
@WebServlet(name="pwmodifyServlet",urlPatterns="/pwmodify")
public class ModifyPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("pwm");
		String pw = request.getParameter("password");
		String pw2 = request.getParameter("password_new");
		
		System.out.println(email);
		System.out.println(pw);
		
		int result = new ModifyPasswordService().Pwmodify(email,pw);
		
		HttpSession session=request.getSession(false);
		
		if(pw.equals(pw2)) {
			//세션이 없으면 가져오지 마라
			if(session!=null) {
				session.invalidate();
			}

			
			response.setContentType("text/html; charset=UTF-8"); 
			response.getWriter().write("<script>alert('비밀번호가 변경되었습니다. 다시로그인 해주세요'); location.replace('"+request.getContextPath()+"/');</script>");

			
			
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
