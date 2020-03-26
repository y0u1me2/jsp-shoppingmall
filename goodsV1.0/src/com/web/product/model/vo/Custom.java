package com.web.product.model.vo;

import java.util.Date;

public class Custom {
	private int cNo;
	private int mNo;
	private int pNo;
	private String color;
	private Date enrollDate;
	private String imageFile;
	
	public Custom() {
		// TODO Auto-generated constructor stub
	}

	public Custom(int cNo, int mNo, int pNo, String color, Date enrollDate, String imageFile) {
		super();
		this.cNo = cNo;
		this.mNo = mNo;
		this.pNo = pNo;
		this.color = color;
		this.enrollDate = enrollDate;
		this.imageFile = imageFile;
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

	public String getImageFile() {
		return imageFile;
	}

	public void setImageFile(String imageFile) {
		this.imageFile = imageFile;
	}

	@Override
	public String toString() {
		return "Custom [cNo=" + cNo + ", mNo=" + mNo + ", pNo=" + pNo + ", color=" + color + ", enrollDate="
				+ enrollDate + ", imageFile=" + imageFile + "]";
	}
	
	
}
