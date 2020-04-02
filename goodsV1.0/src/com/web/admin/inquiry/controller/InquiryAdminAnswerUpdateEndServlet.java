package com.web.admin.inquiry.controller;

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
import com.web.admin.inquiry.model.service.AdminInquiryService;
import com.web.admin.inquiry.model.vo.InquiryAnswer;

@WebServlet("/InquiryAdminAnswerUpdateEnd")
public class InquiryAdminAnswerUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InquiryAdminAnswerUpdateEndServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1:1답변 수정하기
		// 상품수정하기

		// 파일 업로드를 위한 로직처리
		// 1.파일을 저장할 경로설정
		String path = getServletContext().getRealPath("/upload/inquiryAnswer/");

		File folder = new File(path);

		// 해당 디렉토리가 없을경우 디렉토리를 생성
		if (!folder.exists()) {
			try {
				folder.mkdir();
			} catch (Exception e) {
				e.getStackTrace();
			}
		}

		// 1. multipart/formdata로 형석이 넘어왔는지 확인
		if (!ServletFileUpload.isMultipartContent(request)) {

			// 업로드 실패하면 폴더에 저장된 파일삭제
			File f = new File(path);
			if (f.exists()) {
				f.delete();
			}

			// 업로드처리 로직에서 multipart/formdata형식으로 넘어오지 않으면
			// 등록이 안되면 수정페이지로 이동
			request.setAttribute("msg", "답변수정 에러!![form:enctype 관리자에게 문의]");
			request.setAttribute("loc", request.getContextPath() + "/productUpdateView");
			request.getRequestDispatcher("/views/client/common/msg.jsp").forward(request, response);
		}

		// 2.업로드 파일에 대한 최대용량을 설정
		int maxSize = 1024 * 1024 * 10; // 10MB

		// 3.cosjar에서 지원하는 MultipartRequest객체를 생성
		// MultipartRequest(HttpServletRequest, 저장경로, 파일저장최대크기, 문자열인코딩값파일 rename정책)

		MultipartRequest mr = new MultipartRequest(request, path, maxSize, "UTF-8", new DefaultFileRenamePolicy());

		int ino = Integer.parseInt(mr.getParameter("ino"));
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");
		String oriFileName = mr.getOriginalFileName("upfile");
		String renamedFileName = mr.getFilesystemName("upfile");
		
		String id = "admin";
		
		InquiryAnswer ia = new InquiryAnswer(0,ino,id,title,content,null,oriFileName,renamedFileName,"Y",null);
		
		int result = new AdminInquiryService().updateInquiryAnswer(ia);

		if (result > 0) {
			System.out.println("???");
			// 수정성공 : 수정 성공메세지출력, 수정완료한 답변페이지로 이동
			request.setAttribute("msg", "답변 수정이 완료되었습니다.");
			request.setAttribute("loc", "/InquiryAdminAnswer?ino="+ino);
			request.getRequestDispatcher("/views/client/common/msg.jsp").forward(request, response);

		} else {
			System.out.println("!!!");
			// 수정실패 : 수정 실패 메세지 출력, 수정화면으로 이동
			request.setAttribute("msg", "답변 수정이 실패하였습니다.");
			request.setAttribute("loc", "/InquiryAdminAnswerUpdate?ino=" + ino);
			request.getRequestDispatcher("/views/client/common/msg.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
