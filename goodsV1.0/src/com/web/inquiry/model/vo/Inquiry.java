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
	private String i_Original_Filename;
	private String i_Renamed_Filename;
	private String status;
	private String answer_status;
	
	public Inquiry() {
		
	}

	public Inquiry(int i_No, int m_No, String i_Type, String i_Phone, String i_Title, String i_Content, Date i_Date,
			String i_Original_Filename, String i_Renamed_Filename, String status, String answer_status) {
		super();
		this.i_No = i_No;
		this.m_No = m_No;
		this.i_Type = i_Type;
		this.i_Phone = i_Phone;
		this.i_Title = i_Title;
		this.i_Content = i_Content;
		this.i_Date = i_Date;
		this.i_Original_Filename = i_Original_Filename;
		this.i_Renamed_Filename = i_Renamed_Filename;
		this.status = status;
		this.answer_status = answer_status;
	}

	public int getI_No() {
		return i_No;
	}

	public void setI_No(int i_No) {
		this.i_No = i_No;
	}

	public int getM_No() {
		return m_No;
	}

	public void setM_No(int m_No) {
		this.m_No = m_No;
	}

	public String getI_Type() {
		return i_Type;
	}

	public void setI_Type(String i_Type) {
		this.i_Type = i_Type;
	}

	public String getI_Phone() {
		return i_Phone;
	}

	public void setI_Phone(String i_Phone) {
		this.i_Phone = i_Phone;
	}

	public String getI_Title() {
		return i_Title;
	}

	public void setI_Title(String i_Title) {
		this.i_Title = i_Title;
	}

	public String getI_Content() {
		return i_Content;
	}

	public void setI_Content(String i_Content) {
		this.i_Content = i_Content;
	}

	public Date getI_Date() {
		return i_Date;
	}

	public void setI_Date(Date i_Date) {
		this.i_Date = i_Date;
	}

	public String getI_Original_Filename() {
		return i_Original_Filename;
	}

	public void setI_Original_Filename(String i_Original_Filename) {
		this.i_Original_Filename = i_Original_Filename;
	}

	public String getI_Renamed_Filename() {
		return i_Renamed_Filename;
	}

	public void setI_Renamed_Filename(String i_Renamed_Filename) {
		this.i_Renamed_Filename = i_Renamed_Filename;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getAnswer_status() {
		return answer_status;
	}

	public void setAnswer_status(String answer_status) {
		this.answer_status = answer_status;
	}

	@Override
	public String toString() {
		return "Inquiry [i_No=" + i_No + ", m_No=" + m_No + ", i_Type=" + i_Type + ", i_Phone=" + i_Phone + ", i_Title="
				+ i_Title + ", i_Content=" + i_Content + ", i_Date=" + i_Date + ", i_Original_Filename="
				+ i_Original_Filename + ", i_Renamed_Filename=" + i_Renamed_Filename + ", status=" + status
				+ ", answer_status=" + answer_status + "]";
	}

	
}