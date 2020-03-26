package com.web.review.model.vo;

public class Review {
	private int rv_No;
	private int m_No;
	private int p_No;
	private String rv_Title;
	private String rv_Content;
	private int rv_Star;
	private String rv_Ori_Name;
	private String rv_Re_Name;
	public Review() {
		super();
	}
	public Review(int rv_No, int m_No, int p_No, String rv_Title, String rv_Content, int rv_Star, String rv_Ori_Name,
			String rv_Re_Name) {
		super();
		this.rv_No = rv_No;
		this.m_No = m_No;
		this.p_No = p_No;
		this.rv_Title = rv_Title;
		this.rv_Content = rv_Content;
		this.rv_Star = rv_Star;
		this.rv_Ori_Name = rv_Ori_Name;
		this.rv_Re_Name = rv_Re_Name;
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
	public int getP_No() {
		return p_No;
	}
	public void setP_No(int p_No) {
		this.p_No = p_No;
	}
	public String getRv_Title() {
		return rv_Title;
	}
	public void setRv_Title(String rv_Title) {
		this.rv_Title = rv_Title;
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
		
}
