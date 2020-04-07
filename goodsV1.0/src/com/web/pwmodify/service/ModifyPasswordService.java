package com.web.pwmodify.service;

import static com.web.common.JDBCTemplate.close;
import static com.web.common.JDBCTemplate.commit;
import static com.web.common.JDBCTemplate.getConnection;
import static com.web.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.web.pwmodify.dao.ModifyPasswordDao;

public class ModifyPasswordService {


	private ModifyPasswordDao dao=new ModifyPasswordDao();
	
	public int Pwmodify(String email, String pw) {
		Connection conn=getConnection();
		int result=dao.Pwmodify(conn,email,pw);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result; 
	}
}
