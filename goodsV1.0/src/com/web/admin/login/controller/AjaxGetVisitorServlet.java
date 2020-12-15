package com.web.admin.login.controller;

import static com.web.common.JDBCTemplate.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.web.admin.dashboard.service.AdminDashboardService;

/**
 * Servlet implementation class AjaxGetVisitorServlet
 */
@WebServlet("/admin/ajaxGetVisitor")
public class AjaxGetVisitorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxGetVisitorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		LinkedHashMap<String, Integer> map = new AdminDashboardService().visitorCheck();
		
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		String sql = "select TO_CHAR(TO_DATE(visit_date), 'MM/DD'), count(*) from history group by visit_date order by 1";
//		LinkedHashMap<String, Integer> map = new LinkedHashMap<String, Integer>();
//		
//		try {
//			conn = getConnection();
//			pstmt = conn.prepareStatement(sql);
//			rs=pstmt.executeQuery();
//			while(rs.next()) {
//				map.put(rs.getString(1), rs.getInt(2));
//			}
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			try {
//				rs.close();
//				pstmt.close();
//				conn.close();
//			}catch(Exception e) {
//				e.printStackTrace();
//			}
//		}
		
		JSONObject jsonObject = new JSONObject();
		for(String key : map.keySet()) {
            jsonObject.put(key, map.get(key));
        }
        
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(jsonObject); //객체보내기
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
