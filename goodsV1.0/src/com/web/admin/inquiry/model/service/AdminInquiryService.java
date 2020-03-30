package com.web.admin.inquiry.model.service;

import static com.web.common.JDBCTemplate.close;
import static com.web.common.JDBCTemplate.commit;
import static com.web.common.JDBCTemplate.getConnection;
import static com.web.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.web.admin.inquiry.model.dao.AdminInquiryDao;
import com.web.admin.inquiry.model.vo.InquiryAnswer;
import com.web.inquiry.model.vo.Inquiry;

public class AdminInquiryService {
	
	private AdminInquiryDao dao = new AdminInquiryDao();

//1:1문의 전체 목록 보기=================================
	public List<Inquiry> searchInquiry(int cPage, int numPerPage){
		Connection conn = getConnection();
		List<Inquiry> list = dao.searchInquiry(conn,cPage,numPerPage);
			
		close(conn);
					
		return list;					
	}
	
	
	public List<Inquiry> excelInquiry(int cPage, int numPerPage){
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

//1:1문의 답변하기 =====================================
	public int inquiryAnswer(InquiryAnswer ia){
		Connection conn = getConnection();
		int result = dao.inquiryAnswer(conn,ia);
		
		if(result>0) {
			dao.answerStatus(conn,ia); //answer_status Y로 바꾼다
			commit(conn);
		}
		else rollback(conn);
		
		close(conn);
		
		return result;
	} 
	
//1:1문의 상세페이지====================================
	public Inquiry selectInquiry(int no) {
		Connection conn = getConnection();
		
		Inquiry i = dao.selectInquiry(conn,no);
		
		close(conn);
		
		return i;
	}
	
//오늘 등록된 1:1문의=================================
	public int todayInquiry() {
		Connection conn = getConnection();
		
		int result = dao.todayInquiry(conn);
		close(conn);
			
		return result;
	}
	
//답변완료 페이지==================================
	public InquiryAnswer selectInquiryAnswer(int no) {
		Connection conn = getConnection();
		
		InquiryAnswer ia = dao.selectInquiryAnswer(conn,no);
		
		close(conn);
		
		return ia;
	}
	
//체크된 글 삭제하기===================================
	
	 public int inquiryCkDelete(String[] iCkDelete) { 
		 Connection conn = getConnection();
	  
	  int result = dao.inquiryCkDelete(conn, iCkDelete); 
	  
	  if(result>0) commit(conn);
	  else rollback(conn); close(conn);
	  
	  return result; 
	  
	 }	

	  
	 
//답변 수정페이지 출력====================================
	 public InquiryAnswer inquiryView(int no) {
		 Connection conn = getConnection();
		 
		 InquiryAnswer ia = dao. inquiryView(conn,no);
			
		 close(conn);
		 
		 return ia;
	 }
	 
	 
}
