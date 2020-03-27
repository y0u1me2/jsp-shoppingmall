package com.web.profile.model.service;

import static com.web.common.JDBCTemplate.close;
import static com.web.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.web.member.model.vo.Member;
import com.web.profile.model.dao.ProfileDao;

public class ProfileService {

	private ProfileDao dao=new ProfileDao();
	
	public int pwCheck(String email,String pw) {
		Connection conn=getConnection();
		int result=dao.pwCheck(conn,email,pw); //0 또는 1 반환
		close(conn);
		return result;
	}
}
