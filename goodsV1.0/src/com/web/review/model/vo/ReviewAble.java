package com.web.review.model.vo;

import java.util.Date;

public class ReviewAble {
	private int cNo;
	private String pName;
	private String cFileName;
	private Date oDate;
	public ReviewAble() {
		super();
	}
	public ReviewAble(int cNo, String pName, String cFileName, Date oDate) {
		super();
		this.cNo = cNo;
		this.pName = pName;
		this.cFileName = cFileName;
		this.oDate = oDate;
	}
	
	public int getcNo() {
		return cNo;
	}
	public void setcNo(int cNo) {
		this.cNo = cNo;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getcFileName() {
		return cFileName;
	}
	public void setcFileName(String cFileName) {
		this.cFileName = cFileName;
	}
	public Date getoDate() {
		return oDate;
	}
	public void setoDate(Date oDate) {
		this.oDate = oDate;
	}
	
}
