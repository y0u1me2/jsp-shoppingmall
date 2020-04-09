package com.web.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.common.filter.EncryptWrapper;
import com.web.member.model.service.MemberService;

/**
 * Servlet implementation class SaveRandomPwServlet
 */
@WebServlet(name="SaveRandomPwServlet", urlPatterns = "/saveRandomPw")
public class SaveRandomPwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveRandomPwServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String password=(String) request.getAttribute("password");
		String email=(String) request.getAttribute("email");
		System.out.println(EncryptWrapper.getSha512(password));
		String tempPw=EncryptWrapper.getSha512(password);
		//비밀번호 암호화 저장 로직
		int result=new MemberService().saveTempPw(email,tempPw);
		String loc="";
		if(result>0) {
			request.setAttribute("savePw", true);
			loc=request.getContextPath()+"/index.jsp";
		}else {
			request.setAttribute("savePw", false);
			loc=request.getContextPath()+"/index.jsp";
		}
		response.sendRedirect(loc);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
