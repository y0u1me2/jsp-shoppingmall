package com.web.gallery.model.service;
import static com.web.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.web.gallery.model.dao.GalleryDao;
import com.web.gallery.model.vo.Gallery;

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
		String zipFilename = dao.getZipFilename(conn, gNo);
		close(conn);
		return zipFilename;
	}


	public List<Gallery> getGalleryList(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Gallery> list = dao.getGalleryList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}


	public int totalDataCount() {
		Connection conn = getConnection();
		int count = dao.totalDataCount(conn);
		close(conn);
		return count;
	}
}
