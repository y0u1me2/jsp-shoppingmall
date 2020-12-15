package com.web.review.model.vo;

import java.util.Date;

public class Review {
	private int rv_No;
	private int m_No;
	private String m_nickName;
	private int c_No;
	private String rv_Content;
	private int rv_Star;
	private String rv_Ori_Name;
	private String rv_Re_Name;
	private Date rv_Date;
	public Review() {
		super();
	}
	public Review(int m_No, int c_No, String rv_Content, int rv_Star, String rv_Ori_Name, String rv_Re_Name) {
		this.m_No = m_No;
		this.c_No = c_No;
		this.rv_Content=rv_Content;
		this.rv_Star=rv_Star;
		this.rv_Ori_Name=rv_Ori_Name;
		this.rv_Re_Name=rv_Re_Name;
	}
	
	
	public Date getRv_Date() {
		return rv_Date;
	}
	public void setRv_Date(Date rv_Date) {
		this.rv_Date = rv_Date;
	}
	
	public int getRv_No() {
		return rv_No;
	}
	public void setRv_No(int rv_No) {
		this.rv_No = rv_No;
	}
	public int getM_No() {
		return m_No;
	}
	public void setM_No(int m_No) {
		this.m_No = m_No;
	}
	public int getC_No() {
		return c_No;
	}
	public void setC_No(int c_No) {
		this.c_No = c_No;
	}
	
	public String getRv_Content() {
		return rv_Content;
	}
	public void setRv_Content(String rv_Content) {
		this.rv_Content = rv_Content;
	}
	public int getRv_Star() {
		return rv_Star;
	}
	public void setRv_Star(int rv_Star) {
		this.rv_Star = rv_Star;
	}
	public String getRv_Ori_Name() {
		return rv_Ori_Name;
	}
	public void setRv_Ori_Name(String rv_Ori_Name) {
		this.rv_Ori_Name = rv_Ori_Name;
	}
	public String getRv_Re_Name() {
		return rv_Re_Name;
	}
	public void setRv_Re_Name(String rv_Re_Name) {
		this.rv_Re_Name = rv_Re_Name;
	}
	public String getM_nickName() {
		return m_nickName;
	}
	public void setM_nickName(String m_nickName) {
		this.m_nickName = m_nickName;
	}
		
}
