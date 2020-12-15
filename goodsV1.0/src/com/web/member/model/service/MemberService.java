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
	public int googleEnrollMember(Member m) {
		Connection conn=getConnection();
		int result=dao.googleEnrollMember(conn,m);
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
	
	public boolean duplicationNickName(String nickName) {
		Connection conn=getConnection();
		boolean flag=dao.duplicationNickName(conn, nickName);
		close(conn);
		return flag;		
	}
//	비밀번호 체크
	public String passwordCheck(String emailCheck) {
		Connection conn=getConnection();
		String passwordCheck=dao.passwordCheck(conn, emailCheck);
		close(conn);
		return passwordCheck;
	}
//	이메일을 체크해서 인트값으로 받아오는 로직
	public int setMemberEmailChecked(String email) {
		Connection conn=getConnection();
		int result=dao.setMemberEmailChecked(conn, email);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
//	닉네임으로 멤버 객체 받아오는 로직
	public Member searchEmail(String nickName) {
		Connection conn=getConnection();
		Member m=dao.searchEmail(conn,nickName);
		close(conn);
		return m;
	}
//	이메일로 멤버객체 받아오는 로직
	public Member searchEmailGetMember(String email) {
		Connection conn=getConnection();
		Member m=dao.searchEmailGetMember(conn,email);
		close(conn);
		return m;
	}
//	임시 비밀번호 저장 로직
	public int saveTempPw(String email, String tempPw) {
		Connection conn=getConnection();
		int result=dao.saveTempPw(conn, email, tempPw);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

}
