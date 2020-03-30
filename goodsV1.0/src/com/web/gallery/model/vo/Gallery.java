package com.web.gallery.model.vo;

import java.util.Date;

public class Gallery {
	private int gNo;
	private int cNo;
	private Date enrollDate;
	private int likeCnt;
	private int viewCnt;
	private String status;
	
	public Gallery() {
		// TODO Auto-generated constructor stub
	}

	public Gallery(int gNo, int cNo, Date enrollDate, int likeCnt, int viewCnt, String status) {
		super();
		this.gNo = gNo;
		this.cNo = cNo;
		this.enrollDate = enrollDate;
		this.likeCnt = likeCnt;
		this.viewCnt = viewCnt;
		this.status = status;
	}

	public int getgNo() {
		return gNo;
	}

	public void setgNo(int gNo) {
		this.gNo = gNo;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public int getLikeCnt() {
		return likeCnt;
	}

	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Gallery [gNo=" + gNo + ", cNo=" + cNo + ", enrollDate=" + enrollDate + ", likeCnt=" + likeCnt
				+ ", viewCnt=" + viewCnt + ", status=" + status + "]";
	}
	
	
}
