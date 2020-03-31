package com.web.cart.model.vo;

public class Cart {
	
	private String pImage;
	private String pName;
	private int pPrice;
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Cart(String pImage, String pName, int pPrice) {
		super();
		this.pImage = pImage;
		this.pName = pName;
		this.pPrice = pPrice;
	}
	public String getpImage() {
		return pImage;
	}
	public void setpImage(String pImage) {
		this.pImage = pImage;
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
	@Override
	public String toString() {
		return "Cart [pImage=" + pImage + ", pName=" + pName + ", pPrice=" + pPrice + "]";
	}
	
	

}
