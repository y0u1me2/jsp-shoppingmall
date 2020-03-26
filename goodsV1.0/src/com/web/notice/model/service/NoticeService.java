package com.web.notice.model.service;

import java.sql.Connection;
import java.util.List;

import com.web.notice.model.dao.NoticeDao;
import com.web.notice.model.vo.Notice;
import static com.web.common.JDBCTemplate.getConnection;
import static com.web.common.JDBCTemplate.close;

public class NoticeService {
	private NoticeDao dao=new NoticeDao();
	
	public List<Notice> selectNotice(int cPage,int numPerPage){
		Connection conn=getConnection();
		List<Notice> list=dao.selectNotice(conn, cPage, numPerPage);
		close(conn);
		return list;
		
	}
	
	public int countNotice() {
		Connection conn=getConnection();
		int count=dao.countNotice(conn);
		close(conn);
		return count;
	}
}
