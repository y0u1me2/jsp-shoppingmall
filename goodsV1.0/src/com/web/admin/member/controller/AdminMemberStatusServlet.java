package com.web.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.admin.model.service.AdminService;
import com.web.member.model.vo.Member;

/**
 * Servlet implementation class MemberStatusServlet
 */
@WebServlet("/admin/memberStatus")
public class MemberStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberStatusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		List<Member> list = new AdminService().memberNew();
		
		
		int totalMember=new AdminService().memberCount(); //토탈회원
		int deleteMember=new AdminService().memberDeleteCount();//탈퇴회원
		int todayEnrollMember=new AdminService().memberTodayEnrollCount();//오늘가입회원
		
		
		request.setAttribute("list", list);
		request.setAttribute("todayEnrollMember", todayEnrollMember);
		request.setAttribute("totalMember", totalMember);
		request.setAttribute("deleteMember", deleteMember);
		request.getRequestDispatcher("/views/admin/memberStatus.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
