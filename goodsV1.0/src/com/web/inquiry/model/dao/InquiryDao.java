package com.web.inquiry.model.dao;

import static com.web.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.web.admin.inquiry.model.vo.InquiryAnswer;
import com.web.inquiry.model.vo.Inquiry;

public class InquiryDao {

	private Properties prop = new Properties();

	public InquiryDao() {
		try {
			String path = InquiryDao.class.getResource("/sql/client/inquiry-query.properties").getPath();

			prop.load(new FileReader(path));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

//1:1문의하기=========================================
	public int inquiryWrite(Connection conn, Inquiry i) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("inquiryWrite");
		int result = 0;
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, i.getM_No());
			pstmt.setString(2, i.getI_Type());
			pstmt.setString(3, i.getI_Phone());
			pstmt.setString(4, i.getI_Title());
			pstmt.setString(5, i.getI_Content());
			pstmt.setString(6,i.getI_Original_Filename());
			pstmt.setString(7,i.getI_Renamed_Filename());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;// 0이나 1이 반환(행 업데이트)

	}

//1:1문의한 내역보기=======================================
	public List<Inquiry> searchInquiry(Connection conn, int cPage, int numPerPage,int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("searchPageInquiry");

		List<Inquiry> list = new ArrayList();

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, no);
			pstmt.setInt(2, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(3, cPage * numPerPage);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Inquiry i = new Inquiry();

				i.setI_No(rs.getInt("i_no"));
				i.setM_No(rs.getInt("m_no"));
				i.setI_Type(rs.getString("i_type"));
				i.setI_Phone(rs.getString("i_phone"));
				i.setI_Title(rs.getString("i_title"));
				i.setI_Content(rs.getString("i_content"));
				i.setI_Date(rs.getDate("i_date"));
				i.setI_Original_Filename(rs.getString("i_original_filename"));
				i.setI_Renamed_Filename(rs.getString("i_renamed_filename"));
				i.setStatus(rs.getString("status"));
				i.setAnswer_status(rs.getString("answer_status"));

				list.add(i);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

//1:1 문의한 내역 페이지바=======================================
	public int inquiryCount(Connection conn,int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("inquiryCount");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return result;

	}

//1:1문의한 내역 상세화면==================================================
	public Inquiry selectInquiry(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectInquiry");

		Inquiry i = null;

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				i = new Inquiry();

				i.setI_No(rs.getInt("i_no"));
				i.setM_No(rs.getInt("m_no"));
				i.setI_Type(rs.getString("i_type"));
				i.setI_Phone(rs.getString("i_phone"));
				i.setI_Title(rs.getString("i_title"));
				i.setI_Content(rs.getString("i_content"));
				i.setI_Date(rs.getDate("i_date"));
				i.setI_Original_Filename(rs.getString("i_original_filename"));
				i.setI_Renamed_Filename(rs.getString("i_renamed_filename"));
				i.setStatus(rs.getString("status"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return i; // null이거나 주소값이 있거나
	}

// 1:1문의한 답변 상세화면==================================================
	public InquiryAnswer selectInquiryAnswer(Connection conn,int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectInquiryAnswer");

		InquiryAnswer ia = null;

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				ia = new InquiryAnswer();
				
				ia.setIa_No(rs.getInt("ia_no"));
				ia.setAdmin_Id(rs.getString("admin_id"));
				ia.setIa_Title(rs.getString("ia_title"));
				ia.setIa_Content(rs.getString("ia_content"));
				ia.setIa_Date(rs.getDate("ia_date"));
				ia.setIa_Original_Filename(rs.getString("ia_original_filename"));
				ia.setIa_Renamed_Filename(rs.getString("ia_renamed_filename"));
				ia.setIa_Status(rs.getString("ia_status"));
				

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return ia; // null이거나 주소값이 있거나
	}

//1:1문의 삭제하기====================================
	public int deleteInquiry(Connection conn,int no) {

		PreparedStatement pstmt = null;
		int result = 0;

		//실제로 삭제하지 않고, status를 'N'으로 update한다 
		String sql = prop.getProperty("deleteInquiry");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,no);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}
