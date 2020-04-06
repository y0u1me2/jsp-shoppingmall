package com.web.membersecession.service;

import java.sql.Connection;
import static com.web.common.JDBCTemplate.close;
import static com.web.common.JDBCTemplate.getConnection;
import static com.web.common.JDBCTemplate.commit;
import static com.web.common.JDBCTemplate.rollback;
import com.web.membersecession.model.dao.ModifyPasswordDao;

public class ModifyPasswordService {

	private ModifyPasswordDao dao=new ModifyPasswordDao();
	
	public int Modifypw(String email, String pw ) {
		Connection conn=getConnection();
		int result=dao.Modifypw(conn,email,pw);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result; 
	}
}
