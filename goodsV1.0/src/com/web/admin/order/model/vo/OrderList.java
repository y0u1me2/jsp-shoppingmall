package com.web.admin.order.model.vo;

import java.util.Date;

public class OrderList {
	
	private int oNo;
	private String cfileName;
	private String pName;
	private String cColor;
	private int tPrice;
	private int oQuan;
	private String oName;
	private Date oDate;
	private int cNo;

	public OrderList() {
		// TODO Auto-generated constructor stub
	}

	public OrderList(int oNo, String cfileName, String pName, String cColor, int tPrice, int oQuan, String oName,
			Date oDate, int cNo) {
		super();
		this.oNo = oNo;
		this.cfileName = cfileName;
		this.pName = pName;
		this.cColor = cColor;
		this.tPrice = tPrice;
		this.oQuan = oQuan;
		this.oName = oName;
		this.oDate = oDate;
		this.cNo = cNo;
	}

	public int getoNo() {
		return oNo;
	}

	public void setoNo(int oNo) {
		this.oNo = oNo;
	}

	public String getCfileName() {
		return cfileName;
	}

	public void setCfileName(String cfileName) {
		this.cfileName = cfileName;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getcColor() {
		return cColor;
	}

	public void setcColor(String cColor) {
		this.cColor = cColor;
	}

	public int gettPrice() {
		return tPrice;
	}

	public void settPrice(int tPrice) {
		this.tPrice = tPrice;
	}

	public int getoQuan() {
		return oQuan;
	}

	public void setoQuan(int oQuan) {
		this.oQuan = oQuan;
	}

	public String getoName() {
		return oName;
	}

	public void setoName(String oName) {
		this.oName = oName;
	}

	public Date getoDate() {
		return oDate;
	}

	public void setoDate(Date oDate) {
		this.oDate = oDate;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	@Override
	public String toString() {
		return "OrderList [oNo=" + oNo + ", cfileName=" + cfileName + ", pName=" + pName + ", cColor=" + cColor
				+ ", tPrice=" + tPrice + ", oQuan=" + oQuan + ", oName=" + oName + ", oDate=" + oDate + ", cNo=" + cNo
				+ "]";
	}

	
}