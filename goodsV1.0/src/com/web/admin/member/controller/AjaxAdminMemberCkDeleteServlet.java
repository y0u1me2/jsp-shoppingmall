package com.web.admin.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.admin.member.model.service.AdminMemberService;

/**
 * Servlet implementation class MemberCkDeleteServlet
 */
@WebServlet("/admin/memberCkDelete")
public class AjaxAdminMemberCkDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAdminMemberCkDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String[] memCkDelete = request.getParameterValues("memCkArray[]");
		
		int result=new AdminMemberService().memberCkDelete(memCkDelete);
		String msg="";//사용자자에게 띄울 메세지 내용
		String loc="/admin/member/memberList";//메세지 띄운 후 이동할 페이지
		if(result>0) {
			msg="회원삭제 완료";

		}else {
			msg="회원삭제실패";
			
		}
		
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(msg);
		//request.setAttribute("msg", msg);
		//request.setAttribute("loc", loc);
		//RequestDispatcher rd=request.getRequestDispatcher("/views/common/msg.jsp");
		//rd.forward(request, response);

//		System.out.println("넘어오냐");
//		for(int i=0;i<member.length;i++) {
//			System.out.println(member[i]);
//		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
