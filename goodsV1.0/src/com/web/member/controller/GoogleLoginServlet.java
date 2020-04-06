package com.web.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web.member.model.service.MemberService;
import com.web.member.model.vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name="GoogleLoginServlet", urlPatterns = "/googleLogin")
public class GoogleLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GoogleLoginServlet() {
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
		// 1. 구글 이메일 계정 받아서 중복확인하기
		String email = (String)request.getParameter("email");
		String name = (String)request.getParameter("name");
		String nickName = (String)request.getParameter("nickName");
		String password = (String)request.getParameter("password");
		boolean isUseAble=new MemberService().duplicationEmail(email);
		//isUseAble이 true면 생성해야함 / false면 로그인만 함
		if(isUseAble) {
			Member m1 = new Member(email,password, name, nickName);
			int result = new MemberService().googleEnrollMember(m1);
		}
		// 2. DB에 id와 pw가 일치한 값이 있는지 확인하고, 일치하는 값이 있으면 그 데이터를 가져오자
		Member m = new MemberService().loginMember(email,password);
		HttpSession session = request.getSession();
		String loginResult="N";
		String emailCheck=m.getM_EmailCheck();
		String m_status=m.getM_Status();
		//System.out.println(emailCheck);
		//System.out.println(m_status);
		if (m != null&&m_status.equals("Y")&&emailCheck.equals("Y")) {
			loginResult="Y";		
		}
		System.out.println(loginResult);
		session.setAttribute("loginedMember", m);
		session.setAttribute("loginResult", loginResult);
		session.setAttribute("emailCheck", emailCheck);
		session.setAttribute("m_status", m_status);
		session.setAttribute("loginCount", session.getAttribute("loginCount")!=null?(int)session.getAttribute("loginCount")+1:1);
		response.sendRedirect(request.getContextPath()+"/views/client/common/header.jsp");
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
