package com.web.review.model.service;

import static com.web.common.JDBCTemplate.getConnection;
import static com.web.common.JDBCTemplate.close;
import static com.web.common.JDBCTemplate.commit;
import static com.web.common.JDBCTemplate.rollback;

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
	
	public int countReview() {
		Connection conn=getConnection();
		int count=rdao.countReview(conn);
		close(conn);
		return count;
	}
	
	public int countReviewCategory(String p_Category) {
		Connection conn=getConnection();
		int count=rdao.countReviewCategory(conn, p_Category);
		close(conn);
		return count;
	}
	
	public Review reviewView(int reviewNo) {
		Connection conn=getConnection();
		Review review=rdao.reviewView(conn, reviewNo);
		close(conn);
		return review;
	}
	
	public List<Review> searchMyReview(int myNo) {
		Connection conn=getConnection();
		List<Review> list=rdao.searchMyReview(conn, myNo);
		close(conn);
		return list;
	}
	
	public int countMyReview(int myNo) {
		Connection conn=getConnection();
		int count=rdao.countMyReview(conn, myNo);
		close(conn);
		return count;
	}
	
	public List<Review> searchReviewCategory(String p_Category) {
		Connection conn=getConnection();
		List<Review> list=rdao.searchReviewCategory(conn, p_Category);
		close(conn);
		return list;
	}
	
	public int insertReview(Review r) {
		Connection conn=getConnection();
		int result=rdao.insertReview(conn, r);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
}
