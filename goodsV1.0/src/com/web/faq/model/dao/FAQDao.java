package com.web.faq.model.dao;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import static com.web.common.JDBCTemplate.close;

import com.web.faq.model.vo.FAQ;

public class FAQDao {
	

	private Properties prop=new Properties();

	   public FAQDao() {
	      try {
	         String path=FAQDao.class.getResource("/sql/client/faq-query.properties").getPath();
	         prop.load(new FileReader(path));
	      }catch(IOException e) {
	         e.printStackTrace();
	      }
	   }
	   public List<FAQ> selectCategory(Connection conn,String cg){
		   PreparedStatement pstmt=null;
		   ResultSet rs=null;
		   String sql=prop.getProperty("selectCategory");
		   List<FAQ> list =new ArrayList();
		   try {
			   pstmt=conn.prepareStatement(sql);
			   pstmt.setString(1,cg);
			   rs=pstmt.executeQuery();
			   while(rs.next()) {
				   FAQ f=new FAQ();
				   f.setFaq_Title(rs.getString("FAQ_TITLE"));
				   f.setFaq_Content(rs.getString("FAQ_CONTENT"));
				   f.setFaq_Cg(rs.getString("FAQ_CG"));
				   list.add(f);
			   }
		   }catch(SQLException e) {
			   e.printStackTrace();
		   }finally {
			   close(rs);
			   close(pstmt);
		   }
		   return list;
	   }
}
