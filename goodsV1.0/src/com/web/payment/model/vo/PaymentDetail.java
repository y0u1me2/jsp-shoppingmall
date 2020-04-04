package com.web.payment.model.vo;

import java.util.Arrays;

public class PaymentDetail {
	private int oNo;
	private String[] cNo;
	private String[] oQuan;
	public PaymentDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PaymentDetail(int oNo, String[] cNo, String[] oQuan) {
		super();
		this.oNo = oNo;
		this.cNo = cNo;
		this.oQuan = oQuan;
	}
	public int getoNo() {
		return oNo;
	}
	public void setoNo(int oNo) {
		this.oNo = oNo;
	}
	public String[] getcNo() {
		return cNo;
	}
	public void setcNo(String[] cNo) {
		this.cNo = cNo;
	}
	public String[] getoQuan() {
		return oQuan;
	}
	public void setoQuan(String[] oQuan) {
		this.oQuan = oQuan;
	}
	@Override
	public String toString() {
		return "PaymentDetail [oNo=" + oNo + ", cNo=" + Arrays.toString(cNo) + ", oQuan=" + Arrays.toString(oQuan)
				+ "]";
	}
	
}
