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
 * Servlet implementation class MemberListServlet
 */
@WebServlet("/admin/memberList")
public class MemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int cPage;//사용자가 원하는 볼 현재 페이지
		try{
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		
		//int numPerPage=10;//페이지에 출력할 데이터 수
		int numPerPage;
		try {
			numPerPage=Integer.parseInt(request.getParameter("numPerPage"));
			
		}catch(NumberFormatException e) {
			numPerPage=10;
		}
		//설정한 만큼의 회원정보 가져오기
		List<Member> list = new AdminService().searchMember(cPage,numPerPage);
		int totalMember=new AdminService().memberCount(); //전체데이터
		int finderMember=new AdminService().memberCount(); //전체데이터
		int totalPage=(int)Math.ceil((double)totalMember/numPerPage);
		int pageBarSize=5;
		//pageBar의 시작번호, 끝번호까지 출력해주는 변수
		//현재 페이지 : 1~5 -> 1
		//현재 페이지 : 6~10 -> 6
		//현재 페이지 : 11~15 -> 11
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		String pageBar="";
		
		if(pageNo==1) {
			pageBar+="<span>◀ 이전 </span>";
		}else {
//			pageBar+="<a href='"+request.getContextPath()+"/admin/memberList?cPage="+(pageNo-1)+"'>[이전]</a>";
			pageBar+="<a href='"+request.getContextPath()+"/admin/memberList?cPage="+(pageNo-1)+"&numPerPage="+numPerPage+"'>◀ 이전 </a> ";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<span class='cPage'>"+pageNo+"</span>";
			}else {
//				pageBar+="<a href='"+request.getContextPath()+"/admin/memberList?cPage="+pageNo+"'>"+pageNo+"</a>";
				pageBar+="<a href='"+request.getContextPath()+"/admin/memberList?cPage="+pageNo+"&numPerPage="+numPerPage+"'>"+pageNo+"</a> ";
			}
			pageNo++;
		}
		

		//다음
		if(pageNo>totalPage) {
			pageBar+="<span> 다음 ▶</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/admin/memberList?cPage="+pageNo+"&numPerPage="+numPerPage+"'> 다음 ▶</a>";
		}
		
		request.setAttribute("finderMember", finderMember);
		request.setAttribute("totalMember", totalMember);
		request.setAttribute("list", list);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		request.setAttribute("numPerPage", numPerPage);
		request.getRequestDispatcher("/views/admin/memberList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
