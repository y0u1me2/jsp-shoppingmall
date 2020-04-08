package com.web.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.common.Gmail;
import com.web.common.SHA256;

/**
 * Servlet implementation class MemberEmailSendServlet
 */
@WebServlet("/memberPwEmailSend")
public class MemberPwEmailSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberPwEmailSendServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String password=(String) request.getParameter("password");
		String oriPassword=(String) request.getAttribute("password");
		System.out.println(password);
		System.out.println(oriPassword);
		//String host="http://rclass.iptime.org:9999/20AM_GoodGoods/";
		//String host="http://localhost:9090/goods/";
		/*
		 * String
		 * host=request.getRequestURL().toString().replace(request.getRequestURI(),"")+
		 * request.getContextPath()+"/";
		 * 
		 * String from="errornotzoo@gmail.com"; String to = email; String
		 * subject="GOODGOODS 회원가입을 감사드립니다."; String sha256=SHA256.getSHA256(to); String
		 * content="<div style='background-color:pink; width:300px;'>" +
		 * "<div>다음 링크에 접속하시면 회원가입이 완료됩니다.</br></div>" + "<div>" +
		 * "<img width='200px' height='100px' src='https://postfiles.pstatic.net/MjAyMDAzMTZfMTE4/MDAxNTg0MzU0NzY4NTE2.E1U0LOI5LkQUVkIPpTpDMa7yKLOAEONjqtWEhzHrpI4g.30-tvuOG3ncs0Ll-6qzx82T8K3agWuuN5Gf2J_kqf9Qg.PNG.sciencho/%EC%98%81%EB%AC%B8%EA%B2%80%EC%A0%95.png?type=w580'>"
		 * + "</div>" +"<div>" +
		 * "<a href='"+host+"memberEmailCheckAction?code="+sha256+"&nickName="+
		 * nickName+"'>이메일 인증하기</a>" + "</div>" + "</div>";
		 * 
		 * Properties p=new Properties();//실제로 smtp서버를 이용하기위한 정보
		 * 
		 * p.put("mail.smtp.starttls.enable", "true"); p.put("mail.transport.protocol",
		 * "smtp"); p.put("mail.smtp.host", "smtp.gmail.com");
		 * p.setProperty("mail.smtp.socketFactory.class",
		 * "javax.net.ssl.SSLSocketFactory"); p.put("mail.smtp.port", "465");
		 * p.put("mail.smtp.user", from); p.put("mail.smtp.auth", "true");
		 * 
		 * 
		 * try{ Authenticator auth=new Gmail(); Session ses=Session.getInstance(p,auth);
		 * ses.setDebug(true); MimeMessage msg=new MimeMessage(ses);
		 * msg.setSubject(subject);
		 * 
		 * Address fromAddr=new InternetAddress(from); msg.setFrom(fromAddr);//보내는 사람
		 * 
		 * Address toAddr=new InternetAddress(to);
		 * msg.addRecipient(Message.RecipientType.TO, toAddr);//받는사람
		 * 
		 * msg.setContent(content,"text/html;charset=UTF8"); Transport.send(msg);
		 * 
		 * }catch(Exception e) { e.printStackTrace(); } String loc=""; if(result>0) {
		 * loc="/index.jsp?auth=false&enroll=true"; }else {
		 * loc="/index.jsp?auth=false&enroll=false"; } RequestDispatcher
		 * rd=request.getRequestDispatcher(loc); rd.forward(request, response);
		 */
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
