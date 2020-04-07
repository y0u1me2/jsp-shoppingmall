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

import com.web.product.model.vo.ProductImage;

@WebServlet("/admin/productDeleteColorEnd")
public class ProductDeleteColorEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProductDeleteColorEndServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 상품색상 삭제 로직
	
		int no = Integer.parseInt(request.getParameter("no"));
		String[] color = request.getParameterValues("colorInput");
				
		int result = new AdminProductService().colorDelete(no,color);

		if (result > 0) {
			request.setAttribute("msg", "색상삭제가 완료 되었습니다.");
			request.setAttribute("loc", "/admin/ProductListView");

		} else {
			request.setAttribute("msg", "색상삭제가 실패 하였습니다.");
			request.setAttribute("loc", "/admin/productDeleteColor");
		}
		request.getRequestDispatcher("/views/client/common/msg.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
