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
import com.web.mypage.vo.ODMember;
import com.web.product.model.service.ProductService;
import com.web.product.model.vo.Custom;
import com.web.product.model.vo.Product;
import com.web.review.model.service.ReviewService;
import com.web.review.model.vo.Review;
import com.web.review.model.vo.ReviewAble;

/**
 * Servlet implementation class MyReviewLoadServlet
 */
@WebServlet("/myReviewWriteAble")
public class MyReviewWriteAbleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyReviewWriteAbleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    //리뷰 쓸수있는거 조회 컬럼 설정 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		JSONObject jsonObj=new JSONObject();
		String reviewList="";
		String starpoint="";
		int myNo=Integer.parseInt(request.getParameter("myNo"));
		List<ReviewAble> list=new ReviewService().searchWriteAbleReview(myNo);
		int count=new ReviewService().countReviewWriteAble(myNo);
		//html 작성부분
		for(ReviewAble r:list) {
			reviewList+="<div class='writeAbleReviewList' style='border-bottom: 2px solid rgba(0, 0, 0, 0.2); width: 100%;'>"
							+ "<table style='width:100%'>"
								+ "<tr>"
									+ "<td class='reviewProductImg'>"
									+ "<img class='review-product'" 
									+ "src='"+request.getContextPath()+"/upload/custom/"+r.getcFileName()+"'>"
									+ "</td>"
									+ "<td class='reviewTitle' colspan='3'>" + 
									r.getpName()+
									"</td>"
									+ "<td class='reviewDate'>"+r.getoDate()+"</td>"
									+"<td style='align:right'>"
									+"<div class='review-selection'>" 
									+"<div id='reviewWrite'>"
									+"<button type='button' class='reviewWriteBtn'>리뷰쓰기</button>"
									+ "<input type='hidden' value="+r.getcNo()+">"
									+"</div>"
									+"</div>"
									+"</td>"
								+ "</tr>"
							+"</table>"
						+"</div>";
		}
		jsonObj.put("reviewList", reviewList);
		jsonObj.put("count", count);
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
