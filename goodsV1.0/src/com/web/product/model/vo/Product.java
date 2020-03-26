package com.web.product.model.vo;

public class Product {
	private int pNo;
	private String pCategory;
	private String pName;
	private int pPrice;
	private String pThumbnail;
	private String pComment;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	
	
	public Product(int pNo, String pCategory, String pName, int pPrice, String pThumbnail, String pComment) {
		super();
		this.pNo = pNo;
		this.pCategory = pCategory;
		this.pName = pName;
		this.pPrice = pPrice;
		this.pThumbnail = pThumbnail;
		this.pComment = pComment;
	}




	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public String getpCategory() {
		return pCategory;
	}

	public void setpCategory(String pCategory) {
		this.pCategory = pCategory;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public String getpThumbnail() {
		return pThumbnail;
	}

	public void setpThumbnail(String pThumbnail) {
		this.pThumbnail = pThumbnail;
	}

	public String getpComment() {
		return pComment;
	}

	public void setpComment(String pComment) {
		this.pComment = pComment;
	}

	@Override
	public String toString() {
		return "Product [pNo=" + pNo + ", pCategory=" + pCategory + ", pName=" + pName + ", pPrice=" + pPrice
				+ ", pThumbnail=" + pThumbnail + ", pComment=" + pComment + "]";
	}

	
	
	
}
