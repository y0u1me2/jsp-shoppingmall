package com.web.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.web.product.model.service.ProductService;
import com.web.product.model.vo.Custom;
import com.web.product.model.vo.Product;
import com.web.review.model.service.ReviewService;
import com.web.review.model.vo.Review;

/**
 * Servlet implementation class ReviewCategoryServlet
 */
@WebServlet("/reviewCategory")
public class ReviewCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ReviewService rs=new ReviewService();
	ProductService ps=new ProductService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		JSONObject jsonObj=new JSONObject();
		List<Review> list;
		String reviewList="";
		String starpoint="";
		int totalReview=0;
		if(request.getParameter("p_Category")==null) {
			list=rs.searchReview();
			totalReview=rs.countReview();
		}else {
			String p_Category=request.getParameter("p_Category");
			if(p_Category.equals("전체")) {
				list=rs.searchReview();
				totalReview=rs.countReview();
			}else {
				list=rs.searchReviewCategory(p_Category);
				totalReview=rs.countReviewCategory(p_Category);
			}
		}
		//게시글 수 처리 부분
		//더 보기 횟수 제한
		int contentsCount=request.getParameter("contentsCount")==null?0:Integer.parseInt(request.getParameter("contentsCount"));
		int reviewListCount=10; //표시할 리뷰 갯수
		int readMoreBarCount=(int) Math.ceil((double) totalReview / reviewListCount); //더보기 횟수
		int totalMoreReview=0; //더보여줄 최대 횟수
		if(contentsCount+reviewListCount>=totalReview) {
			totalMoreReview=totalReview; //두개 더했는데 크면 최대리뷰수
		}else {
			totalMoreReview=contentsCount+reviewListCount; //두개 더했는데 작으면 그냥 더한값
		}
		//html 작성부분
		//for(Review r:list) {
		for(int j=contentsCount;j<totalMoreReview;j++) {
			starpoint="";
			for(int i=0;i<list.get(j).getRv_Star();i++) {
				starpoint+="<span class='fa fa-star checked'></span>";		
			}
			for(int i=0;i<5-(list.get(j).getRv_Star());i++) {
				starpoint+="<span class='fa fa-star'></span>";
			}
			Custom c=ps.customNo(list.get(j).getC_No());
			System.out.println("커스텀넘버 : "+list.get(j).getC_No());
			System.out.println("서블릿 커스텀파일 : "+c.getCompleteFile());
			Product p=ps.getProduct(c.getpNo());
			reviewList+="<div style='border-bottom: 2px solid rgba(0, 0, 0, 0.2); width: 100%;'>"
					+ "<input id='RvNo' type='hidden' value='"+list.get(j).getRv_No()+"'>"
							+ "<table>"
								+ "<tr>"
									+ "<td class='reviewProductImg' rowspan='3'>"
									+ "<img class='review-product'" 
									+ "src='"+request.getContextPath()+"/upload/custom/"+c.getCompleteFile()+"'>"
									+ "</td>"
									+ "<td class='reviewTitle' colspan='3'>"  
									+p.getpName()
									+"</td></tr>"
									+ "<tr class='reviewTR'>"
									+ "<td class='reviewStar'>"
									+ starpoint+ "</td>"
									+ "<td class='reviewDate'>"+list.get(j).getRv_Date()+"</td>"
									+ "<td class='reviewWriter'>"+list.get(j).getM_nickName()+"</td>"
									+ "</tr><tr><td class='reviewContent' style='width:150px;' colspan='3'>"+list.get(j).getRv_Content()+"</td></tr></table>"
									+ "<div class='reviewImg'>"
									+ "<img"
									+" src='"+request.getContextPath()+"/upload/review/"+list.get(j).getRv_Re_Name()+"'>"
									+"</div>"
									+"</div>";
		}
		jsonObj.put("reviewList", reviewList);
		jsonObj.put("totalReview", totalReview);
		jsonObj.put("totalMoreReview",totalMoreReview);
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(jsonObj,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
