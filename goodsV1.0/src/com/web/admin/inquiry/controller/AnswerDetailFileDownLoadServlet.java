package com.web.admin.inquiry.controller;

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

@WebServlet("/admin/answerDetailFileDownLoad")
public class AnswerDetailFileDownLoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AnswerDetailFileDownLoadServlet() {
		super();

	} 

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//사용자가 1:1문의한 파일 다운
		
		// 파일이 저장되어있는 실제 경로 가져오기
		// 인코딩처리(한글로 된 파일은 글자가 깨짐)
		// 저장파일을 load해줌 inputstream
		// response정보를 수정 -> contentType = application/octet-stream /
		// Content-Disposition:attachment; file-name="파일명"
		// 클라이언트에게 보내줌 -> 파일출력처리 - output write

		// getServletContext().getRealPath = web -> web밑에부터 시작해서 경로를 찾음
		String path = getServletContext().getRealPath("/upload/inquiry/");

		// 쿼리스트링으로 보낸 파일명
		String file = request.getParameter("filePath");

		// 가져온 파일명과 일치하는 파일 가져오기(/upload/inquiryAnswer/filePath)
		File downFile = new File(path + file);
		System.out.println(downFile);

		// 스트림 열기(보조스트림 이용하면 속도가 향상된다)
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(downFile));

		// 보낼 스트림 가져오기(클라이언트 스트림)
		// 그냥보내면 성능이 떨어지므로 보조스트림 이용
		ServletOutputStream sos = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(sos);

		// 파일명 인코딩 처리하기
		String resFileName = "";

		// 익스플로러인지 확인(화면에서 f12->network->user-agent 정보를 다가져온다)
		boolean isMSIE = request.getHeader("user-agent").indexOf("MSIE") != -1
				|| request.getHeader("user-agent").indexOf("Trident") != -1;

		// isMSIE가 true면 IE고 아니면 IE가 아님
		if (isMSIE) {
			resFileName = URLEncoder.encode(file, "UTF-8").replaceAll("\\+", "%20");
			// 익스플로러는 띄어쓰기를 +로 표시하기때문에 인코딩 처리를 다시해준다

		} else {
			// 원본값을 바이트로 바꾼것을 UTF-8로 바꿔주고, 다시 String으로 바꿔준다
			resFileName = new String(file.getBytes("UTF-8"), "ISO-8859-1");
		}

		// 응답하기전 헤더부분 수정 -> 파일형식으로 보내는 것이라고 지정
		// application/octet-stream MIME방식 -> 불특정 파일형식을 응답하겠다는 뜻
		response.setContentType("application/octet-stream");
		// attachment 새창열어서 파일 다운로드 할 수 있게 해주는 것
		response.setHeader("Content-Disposition", "attachment;fileName=" + resFileName);

		// 스트림에서 파일을 읽어 오고 다시 파일을 클라이언트에게 전송!
		// 파일을 끝까지 다읽었을때는 -1이 나온다
		int read = -1;

		// 파일을 끝까지 다읽을때까지 반복한다
		while ((read = bis.read()) != -1) {
			bos.write(read);
		}
		bis.close();
		bos.close();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
