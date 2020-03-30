package com.web.admin.inquiry.model.dao;

import static com.web.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.web.admin.inquiry.model.vo.InquiryAnswer;
import com.web.inquiry.model.vo.Inquiry;

import oracle.sql.ArrayDescriptor;

public class AdminInquiryDao {

	private Properties prop = new Properties();

	public AdminInquiryDao() {
		try {
			String path = AdminInquiryDao.class.getResource("/sql/admin/inquiry-query.properties").getPath();

			prop.load(new FileReader(path));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

//문의 목록 보기=======================================
	public List<Inquiry> searchInquiry(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("searchPageInquiry");

		List<Inquiry> list = new ArrayList();

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(2, cPage * numPerPage);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Inquiry i = new Inquiry();

				i.setI_No(rs.getInt("i_no"));
				i.setI_Type(rs.getString("i_type"));
				i.setI_Phone(rs.getString("i_phone"));
				i.setI_Title(rs.getString("i_title"));
				i.setI_Content(rs.getString("i_content"));
				i.setI_Date(rs.getDate("i_date"));
				i.setI_Original_Filename(rs.getString("i_original_filename"));
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

	public List<Inquiry> excelInquiry(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("searchPageInquiry");

		List<Inquiry> list = new ArrayList();

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(2, cPage * numPerPage);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Inquiry i = new Inquiry();

				i.setI_No(rs.getInt("i_no"));
				i.setI_Type(rs.getString("i_type"));
				i.setI_Phone(rs.getString("i_phone"));
				i.setI_Title(rs.getString("i_title"));
				i.setI_Content(rs.getString("i_content"));
				i.setI_Date(rs.getDate("i_date"));
				i.setI_Original_Filename(rs.getString("i_original_filename"));
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

//문의 목록페이지바=======================================
	public int inquiryCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("inquiryCount");

		try {
			pstmt = conn.prepareStatement(sql);
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

//1:1문의 답변하기=====================================
	public int inquiryAnswer(Connection conn, InquiryAnswer ia) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("inquiryAnswer");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, ia.getI_No());
			pstmt.setString(2, ia.getAdmin_Id());
			pstmt.setString(3, ia.getIa_Title());
			pstmt.setString(4, ia.getIa_Content());
			pstmt.setString(5, ia.getIa_Original_Filename());
			pstmt.setString(6, ia.getIa_Renamed_Filename());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;// 0이나 1이 반환(행 업데이트)

	}

	public int answerStatus(Connection conn, InquiryAnswer ia) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("answerStatus");

		int result = 0;
		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, ia.getI_No());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

//1:1문의 상세페이지====================================
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
				i.setI_Type(rs.getString("i_type"));
				i.setI_Phone(rs.getString("i_phone"));
				i.setI_Title(rs.getString("i_title"));
				i.setI_Content(rs.getString("i_content"));
				i.setI_Date(rs.getDate("i_date"));
				i.setI_Original_Filename(rs.getString("i_Original_Filename"));
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

//오늘 등록된 1:1문의===========================================
	public int todayInquiry(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("todayInquiry");

		try {
			pstmt = conn.prepareStatement(sql);
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

//체크된 글 삭제하기====================================

	public int inquiryCkDelete(Connection conn, String[] iCkDelete) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("inquiryCkDelete");

		for (int i = 0; i<iCkDelete.length; i++) {
			System.out.println(iCkDelete[i]);
		}

		try {
			pstmt = conn.prepareStatement(sql);
			for (int i = 0; i < iCkDelete.length; i++) {
				pstmt.setString(1, iCkDelete[i]);
				result = pstmt.executeUpdate();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

//답변완료한 페이지===============================================
	public InquiryAnswer selectInquiryAnswer(Connection conn, int no) {
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

				ia.setI_No(rs.getInt("ia_no"));
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

//답변 수정페이지==================================================
	public InquiryAnswer inquiryView(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("inquiryView");

		InquiryAnswer ia = null;

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				ia = new InquiryAnswer();

				ia.setI_No(rs.getInt("ia_no"));
				ia.setAdmin_Id(rs.getString("admin_id"));
				ia.setIa_Title(rs.getString("ia_title"));
				ia.setIa_Content(rs.getString("ia_content"));
				ia.setIa_Date(rs.getDate("ia_date"));
				ia.setIa_Original_Filename(rs.getString("ia_original_filename"));
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

}
