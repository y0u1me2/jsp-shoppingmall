package com.web.admin.dashboard.service;
import static com.web.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.LinkedHashMap;
import java.util.List;

import com.web.admin.dashboard.dao.AdminDashboardDao;
import com.web.gallery.model.vo.Gallery2;

public class AdminDashboardService {
	private AdminDashboardDao dao = new AdminDashboardDao();
	
	//인기 상품 조회(판매량 top5)
	public LinkedHashMap<String, Integer> top5Product(){
		Connection conn = getConnection();
		LinkedHashMap<String, Integer> map = dao.top5Product(conn);
		close(conn);
		return map;
	}
	
	//인기 갤러리 조회(다운로드 top5)
	public List<Gallery2> top5Gallery() {
		Connection conn = getConnection();
		List<Gallery2> list = dao.top5Gallery(conn);
		close(conn);
		return list;
	}
	
	//일자별 매출현황 조회
	public LinkedHashMap<String, Integer> salesCheck() {
		Connection conn = getConnection();
		LinkedHashMap<String, Integer> map = dao.salesCheck(conn);
		close(conn);
		return map;
	}

	//일자별 방문자수 조회
	public LinkedHashMap<String, Integer> visitorCheck() {
		Connection conn = getConnection();
		LinkedHashMap<String, Integer> map = dao.visitorCheck(conn);
		close(conn);
		return map;
	}
}
