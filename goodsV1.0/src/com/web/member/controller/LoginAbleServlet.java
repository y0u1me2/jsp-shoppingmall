package com.web.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.web.member.model.service.MemberService;

/**
 * Servlet implementation class LoginAbleServlet
 */
@WebServlet(name="LoginAbleServlet",urlPatterns ="/loginAble")
public class LoginAbleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAbleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String emailCheck=(String) request.getParameter("email");
		String passwordCheck=(String)request.getParameter("password");
		boolean isUseAble=new MemberService().duplicationEmail(emailCheck);
		//isUseAble이 true면 이메일이 DB에 없는것 / false면 이메일이 DB에 있는것
		System.out.println(isUseAble);
		JSONObject obj = new JSONObject();
		//값 전달함
		
		try{
	          obj.put("isUseAble", isUseAble);
	    }catch (Exception e) {    
	    	e.printStackTrace();
	    }

		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(obj.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
