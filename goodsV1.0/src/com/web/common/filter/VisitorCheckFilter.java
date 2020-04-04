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
@WebFilter("/")//index.jsp 페이지 쏴주는 서블릿 만들어야 함!
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
		
		String ip = ((HttpServletRequest)request).getHeader("X-Forwarded-For");
		if (ip == null) ip = ((HttpServletRequest)request).getRemoteAddr();
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
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		if(result>0) {
			commit(conn);
			System.out.println("새로운 방문자");
		}
		else {
			rollback(conn);
			System.out.println("오늘자 방문 기록 있음");
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
