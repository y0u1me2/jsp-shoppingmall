package com.web.notice.model.vo;

import java.util.Date;

public class NoticeComment {
	private int ncNo;
	private int mNo;
	private int nNo;
	private int ncLevel;
	private String ncContent;
	private int ncCommentRef;
	private Date ncDate;
	private String nickName;
	
	public NoticeComment() {
		// TODO Auto-generated constructor stub
	}

	public NoticeComment(int ncNo, int mNo, int nNo, int ncLevel, String ncContent, int ncCommentRef, Date ncDate,
			String nickName) {
		super();
		this.ncNo = ncNo;
		this.mNo = mNo;
		this.nNo = nNo;
		this.ncLevel = ncLevel;
		this.ncContent = ncContent;
		this.ncCommentRef = ncCommentRef;
		this.ncDate = ncDate;
		this.nickName = nickName;
	}

	public int getNcNo() {
		return ncNo;
	}

	public void setNcNo(int ncNo) {
		this.ncNo = ncNo;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public int getnNo() {
		return nNo;
	}

	public void setnNo(int nNo) {
		this.nNo = nNo;
	}

	public int getNcLevel() {
		return ncLevel;
	}

	public void setNcLevel(int ncLevel) {
		this.ncLevel = ncLevel;
	}

	public String getNcContent() {
		return ncContent;
	}

	public void setNcContent(String ncContent) {
		this.ncContent = ncContent;
	}

	public int getNcCommentRef() {
		return ncCommentRef;
	}

	public void setNcCommentRef(int ncCommentRef) {
		this.ncCommentRef = ncCommentRef;
	}

	public Date getNcDate() {
		return ncDate;
	}

	public void setNcDate(Date ncDate) {
		this.ncDate = ncDate;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Override
	public String toString() {
		return "NoticeComment [ncNo=" + ncNo + ", mNo=" + mNo + ", nNo=" + nNo + ", ncLevel=" + ncLevel + ", ncContent="
				+ ncContent + ", ncCommentRef=" + ncCommentRef + ", ncDate=" + ncDate + ", nickName=" + nickName + "]";
	}

	
	
}
