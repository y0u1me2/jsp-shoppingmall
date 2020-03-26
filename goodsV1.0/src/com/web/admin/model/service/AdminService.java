package com.web.admin.model.service;


import static com.web.common.JDBCTemplate.close;
import static com.web.common.JDBCTemplate.commit;
import static com.web.common.JDBCTemplate.getConnection;
import static com.web.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import com.web.admin.model.dao.AdminDao;
import com.web.member.model.vo.Member;
public class AdminService {
	
	private AdminDao dao = new AdminDao();
	
	public List<Member> searchMember(int cPage, int numPerPage){
		//connection관리
		Connection conn = getConnection();
		List<Member> list = dao.searchMember(conn,cPage,numPerPage);
		close(conn);
		return list;
		
	}
	
	public int memberCount() {
		Connection conn=getConnection();
		int result =dao.memberCount(conn);
		close(conn);
		return result;
	}
	public List<Member> searchMemberPage(int cPage, int numPerPage, String type,String keyword){
		Connection conn=getConnection();
		List<Member> list = dao.searchMemberPage(conn,cPage,numPerPage,type,keyword);
		close(conn);
		System.out.println("서비스"+list.size());
		return list;
		
	}
	
	public int memberCount(String type,String keyword) {
		Connection conn=getConnection();
		int result =dao.memberCount(conn,type,keyword);
		close(conn);
		return result;
	}
	
	public int memberDelete(String deleteEmail) {
		Connection conn=getConnection();
		int result=dao.memberDelete(conn,deleteEmail);
		if(result>0) {
			 commit(conn);
		 }else {
			 rollback(conn);
		 }
		 close(conn);
		 return result;
	}
	public int memberCkDelete(String[] memCkDelete) {
		Connection conn=getConnection();
		int result=dao.memberCkDelete(conn,memCkDelete);
		if(result>0) {
			 commit(conn);
		 }else {
			 rollback(conn);
		 }
		 close(conn);
		 return result;
	}
	
	public int memberDeleteCount() {
		Connection conn=getConnection();
		int result =dao.memberDeleteCount(conn);
		close(conn);
		return result;
	}
	
	public int memberTodayEnrollCount() {
		Connection conn=getConnection();
		int result =dao.memberTodayEnrollCount(conn);
		close(conn);
		return result;
	}
	
	public List<Member> memberNew(){
		//connection관리
		Connection conn = getConnection();
		List<Member> list = dao.memberNew(conn);
		close(conn);
		return list;
		
	}

}
