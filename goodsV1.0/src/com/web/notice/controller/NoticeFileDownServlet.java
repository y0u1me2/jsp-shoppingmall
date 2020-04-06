package com.web.notice.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NoticeFileDownServlet
 */
@WebServlet("/notice/noticeFileDownload")
public class NoticeFileDownServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeFileDownServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//파일저장되있는 실제경로 가져오기
		String path=getServletContext().getRealPath("/upload/notice/");
		//보낸 file명 가져오기
		String fileName=request.getParameter("fileName");
		//파일 가져오기
		File file=new File(path+fileName);
		//파일을 가져오기 위해서 인풋스트림 열기(서버 스트림)
		BufferedInputStream bis=new BufferedInputStream(new FileInputStream(file));
		//고객에게 파일을 보내기위해 아웃풋스트림 열기(클라이언트 스트림)
		ServletOutputStream sos=response.getOutputStream();
		BufferedOutputStream bos=new BufferedOutputStream(sos);
		
		//파일명 인코딩 처리
		String resFileName="";
		
		boolean isMSIE=request.getHeader("user-agent").indexOf("MSIE")!=-1||
				request.getHeader("user-agent").indexOf("Trident")!=-1;
		
		if(isMSIE) {
			resFileName=URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+","%20");
			//띄어쓰기를 \,+로 표시함 이건 URL인코딩값으로 변경			
		}else {
			resFileName=new String(fileName.getBytes("UTF-8"),"ISO-8859-1");
		}
		
		//응답하기전 해더부분 수정 -> 파일형식으로 보내는거야 라고 지정
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;fileName="+resFileName);
		
		
		//스트림에서 파일을 읽어 오고 다시 파일을 클라이언트에게 전송!
		int read=-1;
		
		while((read=bis.read())!=-1) {
			bos.write(read);
		}
		
		bis.close();
		bos.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
