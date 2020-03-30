package com.web.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.web.common.CompressionUtil;
import com.web.common.CustomFileRename;
import com.web.gallery.model.service.GalleryService;
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
		
		String path = getServletContext().getRealPath("/upload/custom/");
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
		
		//압축파일 생성
		CompressionUtil cu = new CompressionUtil();
		cu.zip(new File(path+"temp"), false);//temp폴더에 원본 이미지들이 들어 있고 그 폴더를 압축
		
		long currentTime=System.currentTimeMillis();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String newName = "original_"+sdf.format(new Date(currentTime))+".zip";
		
		String oldPath = path+"temp.zip";
		String newPath = path+newName;
		File oldZip = new File(oldPath); //temp.zip
		File newZip = new File(newPath); //original_시간.zip
		boolean check = oldZip.renameTo(newZip); //압축파일 이름 변경
		
		//temp 폴더 안에 있던 원본 이미지들 삭제
		File[] deleteFolderList = new File(path+"temp").listFiles();
		for (int i = 0; i < deleteFolderList.length; i++ ) {
			deleteFolderList[i].delete();
		}
		
		
		Custom c = new Custom();
		c.setpNo(Integer.parseInt(mr.getParameter("pNo")));
//		c.setmNo(Integer.parseInt(mr.getParameter("mNo")));
		c.setmNo(47);
		c.setColor(mr.getParameter("color"));
		c.setCompleteFile(mr.getFilesystemName("complete"));
		c.setOriginalFile(newName);
		
//		List<String> files = new ArrayList<String>();
//		Enumeration params = mr.getFileNames();
//		while(params.hasMoreElements()){
//			String names = (String)params.nextElement();
//			System.out.println(names);
//			if(names.contains("original")) {
//				files.add(mr.getFilesystemName(names));
//			}
//		}
//		System.out.println("커스텀에 사용한 원본 이미지 개수 : "+files.size());

		
		
		
		
		int result = new ProductService().insertCustom(c); //
		if(result>0) {
			System.out.println("데이터 입력 성공");
			int cno = new ProductService().getCustomNo(c);
			System.out.println(new GalleryService().insertNewGallery(cno)); //갤러리 등록 true false
			
			
			//쿠키
//			boolean isExist = false;
//			Cookie[] cookies = request.getCookies(); //null이거나 쿠키배열
//			
//			if(cookies!=null) {
//				for(int i=0; i<cookies.length; i++) {
//					if(cookies[i].getName().equals("cart")) {
//						Cookie cookie = new Cookie("cart", cookies[i].getValue()+","+c.getcNo());
//						isExist = true;
//					}
//				}
//			}
//			
//			if(!isExist) {//쿠키가 없을 경우 쿠키 생성
//				Cookie cookie = new Cookie("cart", ""+c.getcNo());
//			}
			
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
