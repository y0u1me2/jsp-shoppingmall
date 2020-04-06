package com.web.admin.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.admin.member.model.service.AdminMemberService;
import com.web.member.model.vo.Member;

/**
 * Servlet implementation class MemberStatusServlet
 */
@WebServlet("/admin/memberStatus")
public class AdminMemberStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberStatusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		List<Member> list = new AdminMemberService().memberNew();
		
		
		int totalMember=new AdminMemberService().memberCount(); //토탈회원
		int deleteMember=new AdminMemberService().memberDeleteCount();//탈퇴회원
		int todayEnrollMember=new AdminMemberService().memberTodayEnrollCount();//오늘가입회원
		int visitMember=new AdminMemberService().memberVisitCount();//오늘 방문회원
		
		request.setAttribute("list", list);
		request.setAttribute("todayEnrollMember", todayEnrollMember);
		request.setAttribute("totalMember", totalMember);
		request.setAttribute("deleteMember", deleteMember);
		request.setAttribute("visitMember", visitMember);
		request.getRequestDispatcher("/views/admin/member/memberStatus.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
