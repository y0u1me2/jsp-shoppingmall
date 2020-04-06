package com.web.common.filter;

import static com.web.common.JDBCTemplate.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class VisitorCheckFilter
 */
@WebFilter("/index.jsp")
public class VisitorCheckFilter implements Filter {

    /**
     * Default constructor. 
     */
    public VisitorCheckFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		
		HttpServletRequest req = (HttpServletRequest)request;
		
		String ip = req.getHeader("X-Forwarded-For");
		 
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = req.getHeader("Proxy-Client-IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = req.getHeader("WL-Proxy-Client-IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = req.getHeader("HTTP_CLIENT_IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = req.getHeader("HTTP_X_FORWARDED_FOR");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = req.getRemoteAddr();
	    }

		System.out.println(ip); //아이피 가져오기
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO HISTORY VALUES(?, to_char(sysdate, 'YYYYMMDD'))";
		int result = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ip);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			System.out.println("해당 아이피 오늘자 방문 기록 있음!");
		}finally {
			try {
				pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		if(result>0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		
		close(conn);
    		
		
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
