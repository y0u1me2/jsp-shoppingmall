package com.web.inquiry.model.vo;

import java.util.Date;

public class Inquiry {
	
	private int i_No;
	private int m_No;
	private String i_Type;
	private String i_Phone;
	private String i_Title;
	private String i_Content;
	private Date i_Date;
	private String i_Renamed_Filename;
	private String status;
	private String answer_status;
	
	public Inquiry() {
		
	}

	public Inquiry(int i_No, int m_No, String i_Type, String i_Phone, String i_Title, String i_Content, Date i_Date,
			String i_Renamed_Filename, String status, String answer_status) {
		super();
		this.i_No = i_No;
		this.m_No = m_No;
		this.i_Type = i_Type;
		this.i_Phone = i_Phone;
		this.i_Title = i_Title;
		this.i_Content = i_Content;
		this.i_Date = i_Date;
		this.i_Renamed_Filename = i_Renamed_Filename;
		this.status = status;
		this.answer_status = answer_status;
	}

	public final int getI_No() {
		return i_No;
	}

	public final void setI_No(int i_No) {
		this.i_No = i_No;
	}

	public final int getM_No() {
		return m_No;
	}

	public final void setM_No(int m_No) {
		this.m_No = m_No;
	}

	public final String getI_Type() {
		return i_Type;
	}

	public final void setI_Type(String i_Type) {
		this.i_Type = i_Type;
	}

	public final String getI_Phone() {
		return i_Phone;
	}

	public final void setI_Phone(String i_Phone) {
		this.i_Phone = i_Phone;
	}

	public final String getI_Title() {
		return i_Title;
	}

	public final void setI_Title(String i_Title) {
		this.i_Title = i_Title;
	}

	public final String getI_Content() {
		return i_Content;
	}

	public final void setI_Content(String i_Content) {
		this.i_Content = i_Content;
	}

	public final Date getI_Date() {
		return i_Date;
	}

	public final void setI_Date(Date i_Date) {
		this.i_Date = i_Date;
	}

	public final String getI_Renamed_Filename() {
		return i_Renamed_Filename;
	}

	public final void setI_Renamed_Filename(String i_Renamed_Filename) {
		this.i_Renamed_Filename = i_Renamed_Filename;
	}

	public final String getStatus() {
		return status;
	}

	public final void setStatus(String status) {
		this.status = status;
	}

	public final String getAnswer_status() {
		return answer_status;
	}

	public final void setAnswer_status(String answer_status) {
		this.answer_status = answer_status;
	}

	@Override
	public String toString() {
		return "Inquiry [i_No=" + i_No + ", m_No=" + m_No + ", i_Type=" + i_Type + ", i_Phone=" + i_Phone + ", i_Title="
				+ i_Title + ", i_Content=" + i_Content + ", i_Date=" + i_Date + ", i_Renamed_Filename="
				+ i_Renamed_Filename + ", status=" + status + ", answer_status=" + answer_status + "]";
	}

	
}