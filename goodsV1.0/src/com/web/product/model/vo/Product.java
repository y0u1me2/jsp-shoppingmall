package com.web.product.model.vo;

public class Product {
	private int pNo;
	private String pCategory;
	private String pName;
	private int pPrice;
	private String pThumbnail;
	private String pComment;
	private String pStatus;
	private String pSize;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(int pNo, String pCategory, String pName, int pPrice, String pThumbnail, String pComment,
			String pStatus, String pSize) {
		super();
		this.pNo = pNo;
		this.pCategory = pCategory;
		this.pName = pName;
		this.pPrice = pPrice;
		this.pThumbnail = pThumbnail;
		this.pComment = pComment;
		this.pStatus = pStatus;
		this.pSize = pSize;
	}

	public final int getpNo() {
		return pNo;
	}

	public final void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public final String getpCategory() {
		return pCategory;
	}

	public final void setpCategory(String pCategory) {
		this.pCategory = pCategory;
	}

	public final String getpName() {
		return pName;
	}

	public final void setpName(String pName) {
		this.pName = pName;
	}

	public final int getpPrice() {
		return pPrice;
	}

	public final void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public final String getpThumbnail() {
		return pThumbnail;
	}

	public final void setpThumbnail(String pThumbnail) {
		this.pThumbnail = pThumbnail;
	}

	public final String getpComment() {
		return pComment;
	}

	public final void setpComment(String pComment) {
		this.pComment = pComment;
	}

	public final String getpStatus() {
		return pStatus;
	}

	public final void setpStatus(String pStatus) {
		this.pStatus = pStatus;
	}

	public final String getpSize() {
		return pSize;
	}

	public final void setpSize(String pSize) {
		this.pSize = pSize;
	}

	@Override
	public String toString() {
		return "Product [pNo=" + pNo + ", pCategory=" + pCategory + ", pName=" + pName + ", pPrice=" + pPrice
				+ ", pThumbnail=" + pThumbnail + ", pComment=" + pComment + ", pStatus=" + pStatus + ", pSize=" + pSize
				+ "]";
	}

	
}
