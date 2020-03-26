package com.web.notice.model.vo;

import java.util.Date;

public class Notice {
	private int nNo;
	private String nWriter;
	private String nTitle;
	private String nContent;
	private String nOriginalFile;
	private String nRenamedFile;
	private Date nDate;
	private int nReadcount;
	private String nStatus;
	
	public Notice() {
		// TODO Auto-generated constructor stub
	}

	public Notice(int nNo, String nWriter, String nTitle, String nContent, String nOriginalFile, String nRenamedFile,
			Date nDate, int nReadcount, String nStatus) {
		super();
		this.nNo = nNo;
		this.nWriter = nWriter;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nOriginalFile = nOriginalFile;
		this.nRenamedFile = nRenamedFile;
		this.nDate = nDate;
		this.nReadcount = nReadcount;
		this.nStatus = nStatus;
	}

	public int getnNo() {
		return nNo;
	}

	public void setnNo(int nNo) {
		this.nNo = nNo;
	}

	public String getnWriter() {
		return nWriter;
	}

	public void setnWriter(String nWriter) {
		this.nWriter = nWriter;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public String getnOriginalFile() {
		return nOriginalFile;
	}

	public void setnOriginalFile(String nOriginalFile) {
		this.nOriginalFile = nOriginalFile;
	}

	public String getnRenamedFile() {
		return nRenamedFile;
	}

	public void setnRenamedFile(String nRenamedFile) {
		this.nRenamedFile = nRenamedFile;
	}

	public Date getnDate() {
		return nDate;
	}

	public void setnDate(Date nDate) {
		this.nDate = nDate;
	}

	public int getnReadcount() {
		return nReadcount;
	}

	public void setnReadcount(int nReadcount) {
		this.nReadcount = nReadcount;
	}

	public String getnStatus() {
		return nStatus;
	}

	public void setnStatus(String nStatus) {
		this.nStatus = nStatus;
	}

	@Override
	public String toString() {
		return "Notice [nNo=" + nNo + ", nWriter=" + nWriter + ", nTitle=" + nTitle + ", nContent=" + nContent
				+ ", nOriginalFile=" + nOriginalFile + ", nRenamedFile=" + nRenamedFile + ", nDate=" + nDate
				+ ", nReadcount=" + nReadcount + ", nStatus=" + nStatus + "]";
	}
	
	
	
}
