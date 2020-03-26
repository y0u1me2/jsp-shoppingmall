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
 * Servlet implementation class InsertMemberServlet
 */
@WebServlet(name = "MemberEnrollEndServlet", urlPatterns = "/memberEnrollEnd")
public class MemberEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberEnrollEndServlet() {
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
		// 필터에서 엔코딩 가능
//		request.setCharacterEncoding("UTF-8");
//		response.setCharacterEncoding("UTF-8");

		// client가 보낸 데이터를 받아오기!
		String email = request.getParameter("email");
//		System.out.println("암호화 이메일 : "+AESEncrypt.encrypt(email));
//		email=AESEncrypt.encrypt(email);
		String password = request.getParameter("password");
		String userName = request.getParameter("userName");
		String nickName = request.getParameter("nickName");
		//String sha256 = SHA256.getSHA256(email);

		//System.out.println("변수에 넣음 : " + sha256);

		Member m = new Member(email, password, userName, nickName);
		//System.out.println(m.getM_EmailHash());
		System.out.println(m.getM_EmailCheck());
		System.out.println(m.getM_Email());
		System.out.println(m.getM_Name());
		System.out.println(m.getM_NickName());
		int result = new MemberService().enrollMember(m);
		
		request.setAttribute("email", email);
		request.setAttribute("userName", userName);
		request.setAttribute("result", result);
		
		RequestDispatcher rd=request.getRequestDispatcher("/memberEmailSend");
		rd.forward(request, response);
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
