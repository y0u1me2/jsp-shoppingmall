package com.web.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.admin.member.model.service.AdminMemberService;
import com.web.notice.model.service.NoticeService;
import com.web.notice.model.vo.Notice;



/**
 * Servlet implementation class MemberFinderServlet
 */
@WebServlet("/admin/noticeFinder")
public class NoticeFinderAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeFinderAdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String type=request.getParameter("searchType");
		String keyword=request.getParameter("searchKeyword");
		int cPage;

		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		int numPerPage;
		try {
			numPerPage=Integer.parseInt(request.getParameter("numPerPage"));
			
		}catch(NumberFormatException e) {
			numPerPage=10;
		}
		List<Notice> list = new NoticeService().searchNoticePage(cPage,numPerPage,type,keyword);
		//pageBar만들기
		
		
		int totalDate=new NoticeService().countNotice();
		int finderDate=new NoticeService().countNotice(type,keyword);
		int totalPage=(int)Math.ceil((double)finderDate/numPerPage);
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		String pageBar="";
		//이전페이지 만들기
		if(pageNo==1) {
			pageBar+="<span>◀ 이전 <span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/admin/noticeFinder?cPage="+(pageNo-1)+"&searchType="+type+"&searchKeyword="+keyword+"&numPerPage="+numPerPage+"'>◀ 이전 </a>";
		}																							//타입과 키워드가 유지되게하는 로직
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()+"/admin/noticeFinder?cPage="+pageNo+"&searchType="+type+"&searchKeyword="+keyword+"&numPerPage="+numPerPage+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<span> 다음 ▶</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/admin/noticeFinder?cPage="+pageNo+"&searchType="+type+"&searchKeyword="+keyword+"&numPerPage="+numPerPage+"'> 다음 ▶</a>";
		}
		
		
		System.out.println(type);
		

		request.setAttribute("totalDate",totalDate);
		request.setAttribute("finderDate",finderDate);
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
