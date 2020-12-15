package com.web.inquiry.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.web.common.CompressionUtil;
import com.web.common.CustomFileRename;
import com.web.common.MyFileRenamePolicy;
import com.web.gallery.model.service.GalleryService;
import com.web.inquiry.model.service.InquiryService;
import com.web.inquiry.model.vo.Inquiry;
import com.web.product.model.service.ProductService;
import com.web.product.model.vo.Custom;

@WebServlet("/MyInquiryWriteEnd")
public class MyInquiryWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MyInquiryWriteEndServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 1:1 문의하기

		// 파일 업로드를 위한 로직처리
		// 1.처음 압축파일을 저장할 경로설정
		String path = getServletContext().getRealPath("/upload/inquiry/temp/");
		File folder = new File(path);

		// 해당 디렉토리가 없을경우 디렉토리를 생성
		if (!folder.exists())  {
			try {
				folder.mkdir();
			} catch (Exception e) {
				e.getStackTrace();
			}
		}
		
		if(!ServletFileUpload.isMultipartContent(request))
		{
			// 업로드 실패하면 폴더에 저장된 파일삭제
			File f = new File(path);
			if (f.exists()) {
				f.delete();
			}
			// 업로드처리 로직에서 multipart/formdata형식으로 넘어오지 않으면
			// 등록이 안되면 문의글 쓰는 페이지로 다시 이동
			request.setAttribute("msg", "문의 등록에러!![form:enctype 관리자에게 문의]");
			request.setAttribute("loc", request.getContextPath() + "/MyInquiryWrite");
			request.getRequestDispatcher("/views/client/common/msg.jsp").forward(request, response);

		}

		// 업로드 파일 최대용량 설정
		int maxSize = 1024 * 1024 * 10;// 10메가

		// multipartRequest 객체 생성
		// multipartRequest(HttpServletRequest, 저장경로, 파일 최대크기, 문자열인코딩값, 파일 re-name정책)
		MultipartRequest mr = new MultipartRequest(request, path, maxSize, "UTF-8", new MyFileRenamePolicy());

		// 압축파일 생성
		CompressionUtil cu = new CompressionUtil();
		cu.zip(new File(path), false);
		
		
		long currentTime = System.currentTimeMillis();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String newName = "GoodGoods_" + sdf.format(new Date(currentTime)) + ".zip";
		
		//위에서 생성한 압축파일을 리네임 하여 저장하기위해 다시 경로 설정
		String path2 = getServletContext().getRealPath("/upload/inquiry/");
		
		String oldPath = path2+"temp.zip"; //temp.zip
		String newPath = path2+newName; //xx
		File oldZip = new File(oldPath); //temp.zip
		File newZip = new File(newPath); //original_시간.zip
		boolean check = oldZip.renameTo(newZip); //압축파일 이름 변경
		
		int no = Integer.parseInt(mr.getParameter("mNo"));
		String type = mr.getParameter("inquiryType");
		String phone = mr.getParameter("phone");
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");
		
		 		
		// 폴더 안에 있던 원본 이미지들 삭제	
		  File[] deleteFolderList = new File(path).listFiles(); 
		  for (int i = 0; i < deleteFolderList.length; i++) {
			  if(!Arrays.asList(deleteFolderList).contains(".zip")) {
			  deleteFolderList[i].delete(); 
			  }
		  }
		 						
		Inquiry i = new Inquiry(0, no, type, phone, title, content, null, newName, "Y", null);

		// n을 DB에 저장하기
		int result = new InquiryService().inquiryWrite(i);

	}
		


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
