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
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.web.admin.product.service.AdminProductService;
import com.web.common.AdminProductFileRename;
import com.web.common.MyFileRenamePolicy;
import com.web.product.model.vo.Product;
import com.web.product.model.vo.ProductImage;

@WebServlet("/admin/productUpdateEnd")
public class ProductUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProductUpdateEndServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//상품수정하기
		
		// 파일 업로드를 위한 로직처리
		// 1.파일을 저장할 경로설정
		String path = getServletContext().getRealPath("/images/product/");
		
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
					// 등록이 안되면 수정페이지로 이동
					request.setAttribute("msg", "상품정보수정 에러!![form:enctype 관리자에게 문의]");
					request.setAttribute("loc", request.getContextPath() + "/admin/productUpdateView");
					request.getRequestDispatcher("/views/client/common/msg.jsp").forward(request, response);
				}

		// 2.업로드 파일에 대한 최대용량을 설정
		int maxSize = 1024 * 1024 * 10; // 10MB

		// 3.cosjar에서 지원하는 MultipartRequest객체를 생성
		// MultipartRequest(HttpServletRequest, 저장경로, 파일저장최대크기, 문자열인코딩값파일 rename정책)

		MultipartRequest mr = new MultipartRequest(request, path, maxSize, "UTF-8", new  DefaultFileRenamePolicy());

		int pNo = Integer.parseInt(mr.getParameter("pNo"));
		String name = mr.getParameter("pName");
		int price = Integer.parseInt(mr.getParameter("pPrice"));
		String category = mr.getParameter("category");
		String comment = mr.getParameter("comment");
		String[] color = mr.getParameterValues("colorInput");
		String listImage = mr.getOriginalFileName("listImage");
		
		Product p = new Product(pNo, category, name, price, listImage, comment, null);
		
		// 상품이미지저장
		List<ProductImage> imgList = new ArrayList();
		for (String n : color) {
			imgList.add(new ProductImage(0, 0, n, mr.getOriginalFileName(n)));
		}
		
		
		int result = new AdminProductService().updateProduct(p,imgList,pNo);

		if (result > 0) {
			// 수정성공 : 수정 성공메세지출력, 목록페이지로 이동
			request.setAttribute("msg", "상품 정보 수정이 완료되었습니다.");
			request.setAttribute("loc", "/admin/ProductListView?no="+pNo);

		} else {
			// 수정실패 : 수정 실패 메세지 출력
			// 저장실패하면 폴더에 저장된 파일삭제
			request.setAttribute("msg", "상품 정보 수정이 실패하였습니다.");
			request.setAttribute("loc", "/admin/ProductListView?no="+pNo);
		}
		request.getRequestDispatcher("/views/client/common/msg.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
