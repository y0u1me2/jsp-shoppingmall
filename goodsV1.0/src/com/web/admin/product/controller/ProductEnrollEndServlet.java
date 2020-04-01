package com.web.admin.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.web.admin.product.service.AdminProductService;
import com.web.common.AdminProductFileRename;
import com.web.common.CustomFileRename;
import com.web.common.MyFileRenamePolicy;
import com.web.product.model.vo.Product;
import com.web.product.model.vo.ProductImage;

@WebServlet("/productEnrollEnd")
public class ProductEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProductEnrollEndServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 상품등록하기

		// 파일 업로드를 위한 로직처리
		// 1.파일을 저장할 경로설정
		String path = getServletContext().getRealPath("/upload/product/");
		File folder = new File(path);
		System.out.println("경로 : " + path);

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
			// 등록이 안되면 문의글 쓰는 페이지로 다시 이동
			request.setAttribute("msg", "1:1문의등록에러!![form:enctype 관리자에게 문의]");
			request.setAttribute("loc", request.getContextPath() + "/MyInquiryWrite");
			request.getRequestDispatcher("/views/client/common/msg.jsp").forward(request, response);
		}

		// 2.업로드 파일에 대한 최대용량을 설정
		int maxSize = 1024 * 1024 * 10; // 10MB

		// 3.cosjar에서 지원하는 MultipartRequest객체를 생성
		// MultipartRequest(HttpServletRequest, 저장경로, 파일저장최대크기, 문자열인코딩값파일 rename정책)

		MultipartRequest mr = new MultipartRequest(request, path, maxSize, "UTF-8", new AdminProductFileRename());
			
		long currentTime=System.currentTimeMillis();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String newName = "original_"+sdf.format(new Date(currentTime))+".zip";
		
		String name = mr.getParameter("pName");
		String category = mr.getParameter("pCategory");
		int price = Integer.parseInt(mr.getParameter("pPrice"));
		String comment = mr.getParameter("pComment");
		String[] color = mr.getParameterValues("colorInput");
		String listImage = mr.getOriginalFileName("listImage");
		
		
		//Enumeration<String> fileName= mr.getFileNames();
		//HashMap<String,String> imgMap=new HashMap();
				
		Product p = new Product(0, category, name, price, listImage, comment, null);

		//상품이미지저장
		List<ProductImage> imgList = new ArrayList();
		for(String n : color) {
			imgList.add(new ProductImage(0,0,n,mr.getOriginalFileName(n)));
		}
		
		int result = new AdminProductService().productEnroll(p, imgList);

		
		  if (result > 0) { request.setAttribute("msg", "상품등록이 완료 되었습니다.");
		  request.setAttribute("loc", "/productEnroll");
		  
		  } else { request.setAttribute("msg", "상품등록이 실패 하였습니다.");
		  request.setAttribute("loc", "/productEnroll"); }
		  request.getRequestDispatcher("/views/client/common/msg.jsp").forward(request,
		  response);
		 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
