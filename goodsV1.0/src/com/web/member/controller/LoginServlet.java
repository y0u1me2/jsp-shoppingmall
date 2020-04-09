package com.web.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web.member.model.service.MemberService;
import com.web.member.model.vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name="LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 로그인 로직 처리하기
		// 1. client가 보낸 데이터 확인하기
		String email = (String)request.getParameter("email");
		String pw = (String)request.getParameter("password");
		
		// 2. DB에 id와 pw가 일치한 값이 있는지 확인하고, 일치하는 값이 있으면 그 데이터를 가져오자
		Member m = new MemberService().loginMember(email, pw);
		HttpSession session = request.getSession();
		String loginResult="N";
		String emailCheck=m.getM_EmailCheck();
		String m_status=m.getM_Status();
		//System.out.println(emailCheck);
		//System.out.println(m_status);
		if (m != null&&m_status.equals("Y")&&emailCheck.equals("Y")) {
			loginResult="Y";		
		}
		String saveEmail=request.getParameter("saveEmail");
		if(saveEmail.equals("true")) {
			//아이디를 쿠키에 저장하게함.
			Cookie c=new Cookie("saveEmail",email);
			//쿠키의 유효기간설정 7일
			c.setMaxAge(7*24*60*60);
			response.addCookie(c);
		}else {
			//저장된 cookie값 지우고 check된것 해제
			Cookie c=new Cookie("saveEmail",email);
			c.setMaxAge(0);
			response.addCookie(c);
		}
		
		session.setAttribute("loginedMember", m);
		session.setAttribute("loginResult", loginResult);
		session.setAttribute("emailCheck", emailCheck);
		session.setAttribute("m_status", m_status);
		//request.getRequestDispatcher("/header.jsp").forward(request, response);
		response.sendRedirect("/header.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
