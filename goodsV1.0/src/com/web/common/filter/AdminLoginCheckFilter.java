package com.web.common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


/**
 * Servlet Filter implementation class AdminLoginCheck
 */
@WebFilter(urlPatterns= {"/admin/*", "/views/admin/home.jsp"})
public class AdminLoginCheckFilter implements Filter {

    /**
     * Default constructor. 
     */
    public AdminLoginCheckFilter() {
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
		HttpSession session = ((HttpServletRequest)request).getSession();
		String uri = ((HttpServletRequest)request).getRequestURI();
		
		HttpServletRequest request2 = (HttpServletRequest)request;
		
		if(uri.equals(request2.getContextPath()+"/admin/login")||uri.equals(request2.getContextPath()+"/admin/loginCheck")) { //로그인 페이지랑 로그인 확인 서블릿은 필터 제외
			chain.doFilter(request, response);
		}else {
			if(session.getAttribute("loginStatus")==null || !((String)session.getAttribute("loginStatus")).equals("logined")) {
				request.setAttribute("msg", "관리자 로그인이 필요한 서비스입니다. 로그인 페이지로 이동합니다.");
				request.setAttribute("loc", "/admin/login");
				request.getRequestDispatcher("/views/admin/common/msg.jsp").forward(request, response);
			}else {
				// pass the request along the filter chain
				chain.doFilter(request, response);
			}
		}
		
		
		
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
