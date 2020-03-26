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
	
	public int countNotice(String type,String keyword) {
		Connection conn=getConnection();
		int count=dao.countNotice(conn,type,keyword);
		close(conn);
		return count;
	}
	
	public Notice oneNotice(int nNo) {
		Connection conn=getConnection();
		Notice n=dao.oneNotice(conn,nNo);
		close(conn);
		return n;
	}
	public List<Notice> searchNoticePage(int cPage,int numPerPage,String type,String keyword){
		Connection conn=getConnection();
		List<Notice> list=dao.searchNoticePage(conn,cPage,numPerPage,type,keyword);
		close(conn);
		return list;
	}
}
