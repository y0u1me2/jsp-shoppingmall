package com.web.gallery.model.vo;

import java.util.Date;

public class Gallery {
	private int gNo;
	private int cNo;
	private Date enrollDate;
	private int downCnt;
	private int viewCnt;
	private String status;
	private String filename;
	private String mNickname;
	
	public Gallery() {
		// TODO Auto-generated constructor stub
	}

	public Gallery(int gNo, int cNo, Date enrollDate, int downCnt, int viewCnt, String status, String filename,
			String mNickname) {
		super();
		this.gNo = gNo;
		this.cNo = cNo;
		this.enrollDate = enrollDate;
		this.downCnt = downCnt;
		this.viewCnt = viewCnt;
		this.status = status;
		this.filename = filename;
		this.mNickname = mNickname;
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

	public int getDownCnt() {
		return downCnt;
	}

	public void setDownCnt(int downCnt) {
		this.downCnt = downCnt;
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

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getmNickname() {
		return mNickname;
	}

	public void setmNickname(String mNickname) {
		this.mNickname = mNickname;
	}

	@Override
	public String toString() {
		return "Gallery [gNo=" + gNo + ", cNo=" + cNo + ", enrollDate=" + enrollDate + ", downCnt=" + downCnt
				+ ", viewCnt=" + viewCnt + ", status=" + status + ", filename=" + filename + ", mNickname=" + mNickname
				+ "]";
	}

	

	

	
	
	
}
