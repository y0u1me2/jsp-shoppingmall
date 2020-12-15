package com.web.gallery.model.vo;

public class Gallery2 {
	private String mNickname;
	private String filename;
	private int downCnt;
	
	public Gallery2() {
		// TODO Auto-generated constructor stub
	}

	public Gallery2(String mNickname, String filename, int downCnt) {
		super();
		this.mNickname = mNickname;
		this.filename = filename;
		this.downCnt = downCnt;
	}

	public String getmNickname() {
		return mNickname;
	}

	public void setmNickname(String mNickname) {
		this.mNickname = mNickname;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public int getDownCnt() {
		return downCnt;
	}

	public void setDownCnt(int downCnt) {
		this.downCnt = downCnt;
	}

	@Override
	public String toString() {
		return "Gallery2 [mNickname=" + mNickname + ", filename=" + filename + ", downCnt=" + downCnt + "]";
	}
	
	
}
