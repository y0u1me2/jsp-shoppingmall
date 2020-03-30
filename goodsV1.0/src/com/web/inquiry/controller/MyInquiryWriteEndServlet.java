package com.web.inquiry.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.web.common.MyFileRenamePolicy;
import com.web.inquiry.model.service.InquiryService;
import com.web.inquiry.model.vo.Inquiry;

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
		// 1.파일을 저장할 경로설정		
		String path = getServletContext().getRealPath("/upload/inquiry");
	      File folder = new File(path);

	      // 해당 디렉토리가 없을경우 디렉토리를 생성
	      if (!folder.exists()) {
	         try{
	            folder.mkdir();
	          }catch(Exception e){
	              e.getStackTrace();
	           }  
	       }
	      			
		// 2. multipart/formdata로 형석이 넘어왔는지 확인
		if (!ServletFileUpload.isMultipartContent(request)) {

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
				      
		// 공지사항 내용 DB에 저장하고 전송된 파일 was서버 폴더에 저장하는 로직

		// 2.업로드 파일에 대한 최대용량을 설정
		int maxSize = 1024 * 1024 * 10; // 10MB

		// 3.cosjar에서 지원하는 MultipartRequest객체를 생성
		// MultipartRequest(HttpServletRequest, 저장경로, 파일저장최대크기, 문자열인코딩값파일 rename정책)

		MultipartRequest mr = new MultipartRequest(request, path, maxSize, "UTF-8", new MyFileRenamePolicy());

		String type = mr.getParameter("inquiryType");
		String phone = mr.getParameter("phone");
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");
		String oriFileName = mr.getOriginalFileName("upfile");
		String renamedFileName = mr.getFilesystemName("upfile");
		System.out.println(oriFileName);
		System.out.println(renamedFileName);

		int no = 99;		

		Inquiry i = new Inquiry(0, no, type, phone, title, content, null, oriFileName,renamedFileName,"Y",null);
		
		
		// n을 DB에 저장하기
		int result = new InquiryService().inquiryWrite(i);

		if (result > 0) {
			// 저장성공 : 문의 저장성공메세지출력, 나의 문의내역 페이지로 이동
			request.setAttribute("msg", "1:1문의가 등록되었습니다. 빠른 시일 내에 답변 드리겠습니다.");
			request.setAttribute("loc", "/myInquiryList");

		} else {
			// 저장실패 : 문의 저장 실패 메세지 출력, 1:1문의 작성페이지로 이동

			request.setAttribute("msg", "1:1문의가 실패하였습니다.");
			request.setAttribute("loc", "/MyInquiryWrite");
		}
		request.getRequestDispatcher("/views/client/common/msg.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
