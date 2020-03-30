package com.web.inquiry.model.service;

import static com.web.common.JDBCTemplate.close;
import static com.web.common.JDBCTemplate.commit;
import static com.web.common.JDBCTemplate.getConnection;
import static com.web.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.web.admin.inquiry.model.vo.InquiryAnswer;
import com.web.inquiry.model.dao.InquiryDao;
import com.web.inquiry.model.vo.Inquiry;


public class InquiryService {
	
	private InquiryDao dao = new InquiryDao();

	
	
//1:1문의 하기======================================
	public int inquiryWrite(Inquiry i){
		Connection conn = getConnection();
		int result = dao.inquiryWrite(conn,i);
		
		if(result>0) {
			commit(conn);
		}
		else rollback(conn);
				
		close(conn);
		
		return result;
	}

//내가 문의한 내역보기=================================
	public List<Inquiry> searchInquiry(int cPage, int numPerPage){
		Connection conn = getConnection();
		List<Inquiry> list = dao.searchInquiry(conn,cPage,numPerPage);
		
		close(conn);
				
		return list;					
	}

//문의한 내역 페이지바==================================
	public int inquiryCount() {
		Connection conn = getConnection();
		
		int result = dao.inquiryCount(conn);
		close(conn);
		
		return result;		
	}
	
//1:1문의 상세내역========================================
	public Inquiry selectInquiry(int no) {
		Connection conn = getConnection();
		
		Inquiry i = dao.selectInquiry(conn,no);
		
		close(conn);
		
		return i;
	}
	
//1:1답변 확인하기========================================
	public InquiryAnswer selectInquiryAnswer(int no) {
		Connection conn = getConnection();
		
		InquiryAnswer ia = dao.selectInquiryAnswer(conn,no);
		
		close(conn);
		
		return ia;
	}

//1:1문의 삭제하기==========================================
	public int deleteInquiry(int no) {
		Connection conn = getConnection();
		
		int result = dao.deleteInquiry(conn,no);
		
		if(result>0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;

	}	
}