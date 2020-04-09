package com.web.admin.login.controller;

import static com.web.common.JDBCTemplate.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.admin.dashboard.service.AdminDashboardService;
import com.web.gallery.model.vo.Gallery2;

/**
 * Servlet implementation class HomeServlet
 */
@WebServlet("/admin/home")
public class HomePageView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomePageView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AdminDashboardService service = new AdminDashboardService();
		
		LinkedHashMap<String, Integer> map = service.top5Product();
		List<Gallery2> list = service.top5Gallery();
		
		request.setAttribute("map", map);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/admin/home.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
