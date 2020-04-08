package com.web.gallery.model.service;
import static com.web.common.JDBCTemplate.close;
import static com.web.common.JDBCTemplate.commit;
import static com.web.common.JDBCTemplate.getConnection;
import static com.web.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;

import com.web.gallery.model.dao.GalleryDao;
import com.web.gallery.model.vo.Gallery;
import com.web.gallery.model.vo.Reply;
import com.web.mypage.vo.ODMember;

public class GalleryService {
	private GalleryDao dao = new GalleryDao();
	
	public int insertNewGallery(int cNo) {
		Connection conn = getConnection();
		int result = dao.insertNewGallery(conn, cNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	
	public String getZipFilename(int gNo) {
		Connection conn = getConnection();
		String zipFile = dao.getZipFilename(conn, gNo);
		close(conn);
		return zipFile;
	}


	public List<Gallery> getGalleryList(HashMap<String, Object> map) {
		Connection conn = getConnection();
		List<Gallery> list = dao.getGalleryList(conn, map);
		close(conn);
		return list;
	}


	public int totalDataCount(HashMap<String, Object> map) {
		Connection conn = getConnection();
		int count = dao.totalDataCount(conn, map);
		close(conn);
		return count;
	}


	public int downCountPlus(int gNo) {
		Connection conn = getConnection();
		int result = dao.downCountPlus(conn, gNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		
		return result;
	}


	public int viewCntPlus(int gNo) {
		Connection conn = getConnection();
		int result = dao.viewCntPlus(conn, gNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		
		return result;
	}


	public List<Reply> getReplyList(int gNo) {
		Connection conn = getConnection();
		List<Reply> list = dao.getReplyList(conn, gNo);
		close(conn);
		return list;
	}

	
	public List<ODMember> statusGallery(int cNo) {
		Connection conn = getConnection();
		List<ODMember> list = dao.statusGallery(conn,cNo);
		close(conn);
		return list;
	}


	public int insertReply(Reply reply) {
		Connection conn = getConnection();
		int result = dao.insertReply(conn, reply);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
}
