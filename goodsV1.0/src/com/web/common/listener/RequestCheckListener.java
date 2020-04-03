package com.web.common.listener;

import static com.web.common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpServletRequest;

/**
 * Application Lifecycle Listener implementation class Listener2
 *
 */
@WebListener
public class RequestCheckListener implements ServletRequestListener {

    /**
     * Default constructor. 
     */
    public RequestCheckListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletRequestListener#requestDestroyed(ServletRequestEvent)
     */
    public void requestDestroyed(ServletRequestEvent arg0)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletRequestListener#requestInitialized(ServletRequestEvent)
     */
    public void requestInitialized(ServletRequestEvent arg0)  { 
         // TODO Auto-generated method stub
    	
    	HttpServletRequest request = (HttpServletRequest)arg0.getServletRequest();
    	String url = request.getRequestURI();
    	
    	String ip = request.getHeader("X-Forwarded-For");
		if (ip == null) ip = request.getRemoteAddr(); //아이피 주소 가져오기
		System.out.println(url);
		System.out.println(ip);
    	
//    	if(url.contains("index.jsp")||url.equals("/goods/")) {
//    		String ip = request.getHeader("X-Forwarded-For");
//    		if (ip == null) ip = request.getRemoteAddr(); //아이피 주소 가져오기
//    		
//    		Connection conn = null;
//    		PreparedStatement pstmt = null;
//    		String sql = "INSERT INTO HISTORY VALUES(?, SYSDATE)";
//    		int result = 0;
//    		try {
//    			conn = getConnection();
//    			pstmt = conn.prepareStatement(sql);
//    			pstmt.setString(1, ip);
//    			result = pstmt.executeUpdate();
//    		}catch(SQLException e) {
//    			e.printStackTrace();
//    		}finally {
//    			try {
//    				pstmt.close();
//    				
//    			}catch(Exception e) {
//    				e.printStackTrace();
//    			}
//    		}
//    		
//    		
//    		if(result>0) {
//    			commit(conn);
//    			System.out.println("새로운 방문자");
//    		}
//			else {
//				rollback(conn);
//				System.out.println("방문 기록 있음");
//			}
//    		
//    		close(conn);
//    		
//    	}
	    
    }
	
}
