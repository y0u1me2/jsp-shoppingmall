package com.web.member.model.service;

import static com.web.common.JDBCTemplate.close;
import static com.web.common.JDBCTemplate.commit;
import static com.web.common.JDBCTemplate.getConnection;
import static com.web.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.web.member.model.dao.MemberDao;
import com.web.member.model.vo.Member;

public class MemberService {
	
	private MemberDao dao=new MemberDao();
	
	public Member loginMember(String email,String pw) {
		Connection conn=getConnection();
		Member m=dao.loginMember(conn,email,pw);
		close(conn);
		return m;
	}
	
	public int enrollMember(Member m) {
		Connection conn=getConnection();
		int result=dao.enrollMember(conn,m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public boolean duplicationEmail(String emailCheck) {
		Connection conn=getConnection();
		boolean flag=dao.duplicationEmail(conn, emailCheck);
		close(conn);
		return flag;		
	}
	
	public int setMemberEmailChecked(String email) {
		Connection conn=getConnection();
		int result=dao.setMemberEmailChecked(conn, email);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public Member searchEmail(String userName) {
		Connection conn=getConnection();
		Member m=dao.searchEmail(conn,userName);
		close(conn);
		return m;
	}

}
