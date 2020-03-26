package com.web.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.common.SHA256;
import com.web.member.model.service.MemberService;
import com.web.member.model.vo.Member;

/**
 * Servlet implementation class MemberEmailCheckActionServlet
 */
@WebServlet("/memberEmailCheckAction")
public class MemberEmailCheckActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberEmailCheckActionServlet() {
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
		String code = null;
		if (request.getParameter("code") != null) {
			code = request.getParameter("code");
		}

		/*
		 * String email = null; if(request.getAttribute("email")!=null) {
		 * email=(String)request.getAttribute("email"); }if(email == null) { PrintWriter
		 * script = response.getWriter(); script.println("<script>");
		 * script.println("<alert('로그인해주세요')>");
		 * script.println("location.href='userLogin.jsp'"); script.println("</script>");
		 * script.close(); }
		 */
		String userName=(String) request.getParameter("userName");
		Member m=new MemberService().searchEmail(userName);
		
		String email=m.getM_Email();
		String sha256=SHA256.getSHA256(email);
		
		boolean isRight=(sha256.equals(code))?true:false;
		if(isRight==true) {
			int rst=new MemberService().setMemberEmailChecked(email);
			RequestDispatcher rd=null;
			String loc=null;
			if(rst>0) {
				loc="/index.jsp?auth=true";
			}else {
				loc="/";
			}
			request.getRequestDispatcher(loc).forward(request, response);
		}else {
			
		}
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
