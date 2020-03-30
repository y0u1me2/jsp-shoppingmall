package com.web.gallery.controller;

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

import com.web.gallery.model.service.GalleryService;

/**
 * Servlet implementation class CustomImageDownload
 */
@WebServlet("/gallery/imageDownload")
public class ImageDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImageDownloadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//프론트에서 갤러리번호를 전달받고, 디비에서 해당 갤러리 번호를 가지고 압축파일명 가져옴, 해당 압축파일을 다운로드함
		int gNo = Integer.parseInt(request.getParameter("gNo"));
		
		String path = getServletContext().getRealPath("/upload/custom/");
		String file = new GalleryService().getZipFilename(gNo);
		
		
		
		File downFile = new File(path+file);
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(downFile)); //속도 향상을 위해 보조스트림 사용
		
		ServletOutputStream sos = response.getOutputStream(); //파일을 클라이언트에게 보낼 때 사용할 스트림
		BufferedOutputStream bos = new BufferedOutputStream(sos); //속도 향상을 위한 보조스트림
		
		//파일명 인코딩 처리하기
		String resFileName = "";
		boolean isMSIE=request.getHeader("user-agent").indexOf("MSIE")>0||request.getHeader("user-agent").indexOf("Trident")>0;
		//true면 브라우저가 IE
		if(isMSIE) {
			resFileName = URLEncoder.encode(file, "UTF-8").replaceAll("\\+", "%20"); //ie에서는 띄어쓰기를 \, +로 표시하므로
		}else {
			resFileName = new String(file.getBytes("UTF-8"), "ISO-8859-1"); //바이트 형식으로 바꿨다가 다시 스트링으로
		}
		
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;fileName="+resFileName);
		//attachment방식 -> 다운로드 창이 열림, inline 방식-> 다운로드하고 그냥 브라우저 창에서 열림
		
		//스트림에서 파일을 읽어오고 다시 파일을 클라이언트에게 전송
		int read = -1;
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
