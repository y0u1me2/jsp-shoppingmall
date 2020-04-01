package com.web.notice.model.service;

import java.sql.Connection;
import java.util.List;

import com.web.notice.model.dao.NoticeDao;
import com.web.notice.model.vo.Notice;
import static com.web.common.JDBCTemplate.getConnection;
import static com.web.common.JDBCTemplate.close;
import static com.web.common.JDBCTemplate.rollback;
import static com.web.common.JDBCTemplate.commit;

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
	
	public Notice oneNotice(int nNo,boolean hasRead) {
		Connection conn=getConnection();
		Notice n=dao.oneNotice(conn,nNo);
		if(n!=null&&!hasRead) {
			int result=dao.updateReadCount(conn,nNo);
			if(result>0) {
				n.setnReadcount(dao.oneNotice(conn, nNo).getnReadcount());
				commit(conn);
			}else {
				rollback(conn);
			}
		}
		close(conn);
		return n;
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
	
	public int oneDelete(int no) {
		Connection conn=getConnection();
		int count=dao.oneDelete(conn,no);
		if(count>0) commit(conn);
		else rollback(conn);
		close(conn);
		return count;
	}
	
	public int checkDelete(String [] check) {
		Connection conn=getConnection();
		int count=dao.checkDelete(conn,check);
		if(count>0) commit(conn);
		else rollback(conn);
		close(conn);
		return count;
	}
	
	public int insertNotice(Notice n) {
		Connection conn=getConnection();
		int result=dao.insertNotice(conn,n);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int updateNotice(Notice n) {
		Connection conn=getConnection();
		int result=dao.updateNotice(conn,n);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	
	
}
