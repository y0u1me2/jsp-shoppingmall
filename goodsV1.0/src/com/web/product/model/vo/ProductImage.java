package com.web.product.model.vo;

public class ProductImage {
	private int pImageNo;
	private int pNo;
	private String color;
	private String fileName;
	
	public ProductImage() {
		// TODO Auto-generated constructor stub
	}

	public ProductImage(int pImageNo, int pNo, String color, String fileName) {
		super();
		this.pImageNo = pImageNo;
		this.pNo = pNo;
		this.color = color;
		this.fileName = fileName;
	}

	public int getpImageNo() {
		return pImageNo;
	}

	public void setpImageNo(int pImageNo) {
		this.pImageNo = pImageNo;
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

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Override
	public String toString() {
		return "ProductImage [pImageNo=" + pImageNo + ", pNo=" + pNo + ", color=" + color + ", fileName=" + fileName
				+ "]";
	}
	
	
	
}
