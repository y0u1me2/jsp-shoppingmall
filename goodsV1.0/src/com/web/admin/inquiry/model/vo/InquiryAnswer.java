package com.web.admin.inquiry.model.vo;

import java.util.Date;

public class InquiryAnswer {
	
	private int ia_No;
	private int i_No;
	private String admin_Id;
	private String ia_Title;
	private String ia_Content;
	private Date ia_Date;
	private String ia_Original_Filename;
	private String ia_Renamed_Filename;
	private String ia_Status;
	private String ia_Answer_Status;
	
	public InquiryAnswer() {
	
	}

	public InquiryAnswer(int ia_No, int i_No, String admin_Id, String ia_Title, String ia_Content, Date ia_Date,
			String ia_Original_Filename, String ia_Renamed_Filename, String ia_Status, String ia_Answer_Status) {
		super();
		this.ia_No = ia_No;
		this.i_No = i_No;
		this.admin_Id = admin_Id;
		this.ia_Title = ia_Title;
		this.ia_Content = ia_Content;
		this.ia_Date = ia_Date;
		this.ia_Original_Filename = ia_Original_Filename;
		this.ia_Renamed_Filename = ia_Renamed_Filename;
		this.ia_Status = ia_Status;
		this.ia_Answer_Status = ia_Answer_Status;
	}

	public final int getIa_No() {
		return ia_No;
	}

	public final void setIa_No(int ia_No) {
		this.ia_No = ia_No;
	}

	public final int getI_No() {
		return i_No;
	}

	public final void setI_No(int i_No) {
		this.i_No = i_No;
	}

	public final String getAdmin_Id() {
		return admin_Id;
	}

	public final void setAdmin_Id(String admin_Id) {
		this.admin_Id = admin_Id;
	}

	public final String getIa_Title() {
		return ia_Title;
	}

	public final void setIa_Title(String ia_Title) {
		this.ia_Title = ia_Title;
	}

	public final String getIa_Content() {
		return ia_Content;
	}

	public final void setIa_Content(String ia_Content) {
		this.ia_Content = ia_Content;
	}

	public final Date getIa_Date() {
		return ia_Date;
	}

	public final void setIa_Date(Date ia_Date) {
		this.ia_Date = ia_Date;
	}

	public final String getIa_Original_Filename() {
		return ia_Original_Filename;
	}

	public final void setIa_Original_Filename(String ia_Original_Filename) {
		this.ia_Original_Filename = ia_Original_Filename;
	}

	public final String getIa_Renamed_Filename() {
		return ia_Renamed_Filename;
	}

	public final void setIa_Renamed_Filename(String ia_Renamed_Filename) {
		this.ia_Renamed_Filename = ia_Renamed_Filename;
	}

	public final String getIa_Status() {
		return ia_Status;
	}

	public final void setIa_Status(String ia_Status) {
		this.ia_Status = ia_Status;
	}

	public final String getIa_Answer_Status() {
		return ia_Answer_Status;
	}

	public final void setIa_Answer_Status(String ia_Answer_Status) {
		this.ia_Answer_Status = ia_Answer_Status;
	}

	@Override
	public String toString() {
		return "InquiryAnswer [ia_No=" + ia_No + ", i_No=" + i_No + ", admin_Id=" + admin_Id + ", ia_Title=" + ia_Title
				+ ", ia_Content=" + ia_Content + ", ia_Date=" + ia_Date + ", ia_Original_Filename="
				+ ia_Original_Filename + ", ia_Renamed_Filename=" + ia_Renamed_Filename + ", ia_Status=" + ia_Status
				+ ", ia_Answer_Status=" + ia_Answer_Status + "]";
	}

	
	
	

	

}

