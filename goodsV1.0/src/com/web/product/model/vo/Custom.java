package com.web.product.model.vo;

import java.util.Date;

public class Custom {
	private int cNo;
	private int mNo;
	private int pNo;
	private String color;
	private Date enrollDate;
	private String completeFile;
	private String originalFile;
	
	public Custom() {
		// TODO Auto-generated constructor stub
	}

	public Custom(int cNo, int mNo, int pNo, String color, Date enrollDate, String completeFile, String originalFile) {
		super();
		this.cNo = cNo;
		this.mNo = mNo;
		this.pNo = pNo;
		this.color = color;
		this.enrollDate = enrollDate;
		this.completeFile = completeFile;
		this.originalFile = originalFile;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getCompleteFile() {
		return completeFile;
	}

	public void setCompleteFile(String completeFile) {
		this.completeFile = completeFile;
	}

	public String getOriginalFile() {
		return originalFile;
	}

	public void setOriginalFile(String originalFile) {
		this.originalFile = originalFile;
	}

	@Override
	public String toString() {
		return "Custom [cNo=" + cNo + ", mNo=" + mNo + ", pNo=" + pNo + ", color=" + color + ", enrollDate="
				+ enrollDate + ", completeFile=" + completeFile + ", originalFile=" + originalFile + "]";
	}
	
	
	
	
}
