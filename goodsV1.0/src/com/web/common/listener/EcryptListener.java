package com.web.common.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.web.common.encrypt.AESEncrypt;

/**
 * Application Lifecycle Listener implementation class EcryptListener
 *
 */
@WebListener
public class EcryptListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public EcryptListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent arg0)  { 
    	System.out.println(arg0.getServletContext().getRealPath("/WEB-INF"));
    	String path=arg0.getServletContext().getRealPath("/WEB-INF");
         new AESEncrypt(path);
    }
	
}
