package com.web.gallery.model.vo;


public class Reply {
	private int rNo;
	private int gNo;
	private int mNo;
	private String mNickname;
	private String rContent;
	private String rDate;
	
	public Reply() {
		// TODO Auto-generated constructor stub
	}

	public Reply(int rNo, int gNo, int mNo, String mNickname, String rContent, String rDate) {
		super();
		this.rNo = rNo;
		this.gNo = gNo;
		this.mNo = mNo;
		this.mNickname = mNickname;
		this.rContent = rContent;
		this.rDate = rDate;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public int getgNo() {
		return gNo;
	}

	public void setgNo(int gNo) {
		this.gNo = gNo;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getmNickname() {
		return mNickname;
	}

	public void setmNickname(String mNickname) {
		this.mNickname = mNickname;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public String getrDate() {
		return rDate;
	}

	public void setrDate(String rDate) {
		this.rDate = rDate;
	}

	@Override
	public String toString() {
		return "Reply [rNo=" + rNo + ", gNo=" + gNo + ", mNo=" + mNo + ", mNickname=" + mNickname + ", rContent="
				+ rContent + ", rDate=" + rDate + "]";
	}

	
	
	
}
