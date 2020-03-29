package com.web.product.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.web.common.CompressionUtil;
import com.web.common.CustomFileRename;
import com.web.product.model.service.ProductService;
import com.web.product.model.vo.Custom;

/**
 * Servlet implementation class ProductCustomEndServlet
 */
@WebServlet("/product/customEnd")
public class ProductCustomEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductCustomEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String path = getServletContext().getRealPath("/upload/custom");
		File folder = new File(path);

		// 해당 디렉토리가 없을경우 디렉토리를 생성
		if (!folder.exists()) {
			try{
				folder.mkdir();
		    }catch(Exception e){
	        	e.getStackTrace();
	        }  
	    }
		
		
		//업로드 파일 최대용량 설정
		int maxSize = 1024*1024*10;//10메가
		
		//multipartRequest 객체 생성
		//multipartRequest(HttpServletRequest, 저장경로, 파일 최대크기, 문자열인코딩값, 파일 re-name정책)
		//여기서 파일 저장함
		MultipartRequest mr = new MultipartRequest(request, path, maxSize, "UTF-8", new CustomFileRename());
		
		//압축파일
		CompressionUtil cu = new CompressionUtil();
		cu.zip(new File(path));

		
		
		
		Custom c = new Custom();
		c.setpNo(Integer.parseInt(mr.getParameter("pNo")));
		c.setmNo(Integer.parseInt(mr.getParameter("mNo")));
		c.setColor(mr.getParameter("color"));
		c.setImageFile(mr.getFilesystemName("complete"));
		
		
		List<String> files = new ArrayList<String>();
		
		Enumeration params = mr.getFileNames();
		while(params.hasMoreElements()){
			String names = (String)params.nextElement();
			System.out.println(names);
			if(names.contains("original")) {
				files.add(mr.getFilesystemName(names));
			}
		}
		System.out.println("커스텀에 사용한 원본 이미지 개수 : "+files.size());

		
		
		
		
		int result = new ProductService().insertCustom(c, files); //커스텀 제품 등록&커스텀에 사용한 이미지 등록 -> 실패시 0, 성공시 저장한 이미지 개수
		if(result>0) {
			System.out.println("데이터 입력 성공, 저장한 이미지 개수: "+result);
		}else {
			System.out.println("데이터 입력 실패");
		}

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
