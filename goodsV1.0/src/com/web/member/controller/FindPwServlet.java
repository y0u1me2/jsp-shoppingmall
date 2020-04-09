package com.web.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FindPwServlet
 */
@WebServlet("/findPw")
public class FindPwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPwServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//새로운 비밀번호 생성 후 
		String pwEmail=request.getParameter("findPwEmail");
		String pwUserName=request.getParameter("findPwUserName");
		//System.out.println(pwEmail);
		//System.out.println(pwUserName);
		String newPw=getRandomPassword(13);
		request.setAttribute("password", newPw);
		request.setAttribute("email", pwEmail);
		RequestDispatcher rd=request.getRequestDispatcher("/memberPwEmailSend");
		rd.forward(request, response);
	}
	public static String getRandomPassword(int len) {
		  char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7',
				'8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 
				'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 
				'U', 'V', 'W', 'X', 'Y', 'Z' ,'a', 'b', 'c', 'd', 'e', 'f', 'g',
				'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',	'p', 'q', 'r', 's', 't',
				'u', 'v', 'w', 'x', 'y', 'z', '!', '@' ,'#', '$'};

		  int idx = 0;
		  StringBuffer sb = new StringBuffer();
		  
		  //System.out.println("charSet.length :::: "+charSet.length);
		  
		  for (int i = 0; i < len; i++) {
			
			  idx = (int) (charSet.length * Math.random()); // 36 * 생성된 난수를  Int로 추출 (소숫점제거)
			  //System.out.println("idx :::: "+idx);
			  sb.append(charSet[idx]);
		  }

		  return sb.toString();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
