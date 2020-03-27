package com.web.review.model.service;

import static com.web.common.JDBCTemplate.getConnection;
import static com.web.common.JDBCTemplate.close;

import java.sql.Connection;
import java.util.List;

import com.web.review.model.dao.ReviewDao;
import com.web.review.model.vo.Review;

public class ReviewService {
	
	ReviewDao rdao=new ReviewDao();
	
	public List<Review> searchReview() {
		Connection conn=getConnection();
		List<Review> list=rdao.searchReview(conn);
		close(conn);
		return list;		
	}
	
	public Review reviewView(int reviewNo) {
		Connection conn=getConnection();
		Review review=rdao.reviewView(conn, reviewNo);
		close(conn);
		return review;
	}
}
