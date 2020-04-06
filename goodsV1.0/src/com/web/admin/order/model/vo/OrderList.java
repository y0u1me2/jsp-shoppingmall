package com.web.admin.order.model.vo;

import java.util.Date;

public class OrderList {
	private int omNo;
	private int oNo;
	private int cNo;
	private int pNo;
	private String fileName;
	private String pName;
	private int pQuan;
	private int pPrice;
	private int tPrice;
	private String oName;
	private Date oDate;
	
	public OrderList() {
		// TODO Auto-generated constructor stub
	}

	public OrderList(int omNo, int oNo, int cNo, int pNo, String fileName, String pName, int pQuan, int pPrice,
			int tPrice, String oName, Date oDate) {
		super();
		this.omNo = omNo;
		this.oNo = oNo;
		this.cNo = cNo;
		this.pNo = pNo;
		this.fileName = fileName;
		this.pName = pName;
		this.pQuan = pQuan;
		this.pPrice = pPrice;
		this.tPrice = tPrice;
		this.oName = oName;
		this.oDate = oDate;
	}

	public int getOmNo() {
		return omNo;
	}

	public void setOmNo(int omNo) {
		this.omNo = omNo;
	}

	public int getoNo() {
		return oNo;
	}

	public void setoNo(int oNo) {
		this.oNo = oNo;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getpQuan() {
		return pQuan;
	}

	public void setpQuan(int pQuan) {
		this.pQuan = pQuan;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public int gettPrice() {
		return tPrice;
	}

	public void settPrice(int tPrice) {
		this.tPrice = tPrice;
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

	@Override
	public String toString() {
		return "OrderList [omNo=" + omNo + ", oNo=" + oNo + ", cNo=" + cNo + ", pNo=" + pNo + ", fileName=" + fileName
				+ ", pName=" + pName + ", pQuan=" + pQuan + ", pPrice=" + pPrice + ", tPrice=" + tPrice + ", oName="
				+ oName + ", oDate=" + oDate + "]";
	}

	
	
}
