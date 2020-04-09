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
		System.out.println(isUseAble?"가입있음":"없음");
		//isUseAble이 true면 생성해야함 / false면 로그인만 함
		Member googleNew=null;  //구글 새로운 로그인
		Member googleNewReal=null;  //구글 새로운 로그인
		Member googleOld=null; //구글 기존의 사용자
		Member googleLogin=null; //구글 로그인 해봤던 사람
		Member googleAccount=null; //구글 계정으로 가입한 사람
		Member m=null; //구글 계정으로 가입한 사람
		HttpSession session = request.getSession();
		String loginResult="N";
		String emailCheck=null;
		String m_status=null;
		
		if(isUseAble) {//구글로 로그인 한적이 없고 가입 한적도 없슈
			System.out.println("새거");
			googleNew = new Member(email,password, name, nickName);
			int result = new MemberService().googleEnrollMember(googleNew);
			googleNewReal = new MemberService().loginMember(email,password);
			emailCheck=googleNew.getM_EmailCheck();
			m_status=googleNew.getM_Status();
			m=googleNewReal;
		}else {
			System.out.println("헌집");
			googleOld=new MemberService().searchEmailGetMember(email);
			if(googleOld.getM_Password()==password) {
				System.out.println("이거 구글로 로그인");
				//구글로 로그인 한사람 비밀번호 같으면 구글로 로그인 실행
					googleLogin = new MemberService().loginMember(email,password);
					emailCheck=googleLogin.getM_EmailCheck();
					m_status=googleLogin.getM_Status();
					m=googleLogin;
			}else {//구글로 가입했는데 구글로 로그인 한사람 비밀번호 다르면 구글로 가입한 계정으로 로그인
					System.out.println("이거 구글로 가입");
					googleAccount = new MemberService().loginMember(googleOld.getM_Email(),googleOld.getM_Password());
					emailCheck=googleAccount.getM_EmailCheck();
					m_status=googleAccount.getM_Status();
					m=googleAccount;				
			}			
		}
			
		if (m != null&&m_status.equals("Y")&&emailCheck.equals("Y")) {
			loginResult="Y";		
		}
		System.out.println("멜첵"+emailCheck);
		System.out.println("회원상태"+m_status);
		System.out.println("로그인상태"+loginResult);
		session.setAttribute("loginedMember", m);
		session.setAttribute("loginResult", loginResult);
		session.setAttribute("emailCheck", emailCheck);
		session.setAttribute("m_status", m_status);
		session.setAttribute("loginCount", session.getAttribute("loginCount")!=null?(int)session.getAttribute("loginCount")+1:1);
		//request.getRequestDispatcher(request.getContextPath()+"/views/client/common/header.jsp").forward(request, response);
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
