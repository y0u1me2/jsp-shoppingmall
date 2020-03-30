package com.web.gallery.model.service;
import static com.web.common.JDBCTemplate.*;

import java.sql.Connection;

import com.web.gallery.model.dao.GalleryDao;

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
}
