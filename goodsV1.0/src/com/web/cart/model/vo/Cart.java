package com.web.cart.model.vo;

import java.util.Date;

public class Cart {
	
	private String cImage;
	private String cName;
	private int cPrice;
	private Date cDate;
	private int cCno;
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Cart(String cImage, String cName, int cPrice, Date cDate, int cCno) {
		super();
		this.cImage = cImage;
		this.cName = cName;
		this.cPrice = cPrice;
		this.cDate = cDate;
		this.cCno = cCno;
	}
	public String getcImage() {
		return cImage;
	}
	public void setcImage(String cImage) {
		this.cImage = cImage;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public int getcPrice() {
		return cPrice;
	}
	public void setcPrice(int cPrice) {
		this.cPrice = cPrice;
	}
	public Date getcDate() {
		return cDate;
	}
	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}
	public int getcCno() {
		return cCno;
	}
	public void setcCno(int cCno) {
		this.cCno = cCno;
	}
	@Override
	public String toString() {
		return "Cart [cImage=" + cImage + ", cName=" + cName + ", cPrice=" + cPrice + ", cDate=" + cDate + ", cCno="
				+ cCno + "]";
	}
	
	
	

}
