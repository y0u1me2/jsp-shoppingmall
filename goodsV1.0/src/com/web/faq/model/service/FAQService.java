package com.web.faq.model.service;

import static com.web.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.web.faq.model.dao.FAQDao;
import com.web.faq.model.vo.FAQ;
import static com.web.common.JDBCTemplate.close;

public class FAQService {
	private FAQDao fdao= new FAQDao();
	
	public List<FAQ> selectCategory(String cg) {
		Connection conn=getConnection(); 
		List<FAQ> list= fdao.selectCategory(conn,cg);
		close(conn);
		return list;
	}
}
