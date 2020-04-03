package com.web.payment.model.vo;

import java.util.Arrays;
import java.util.Date;

public class Payment {
	private int o_No;
	private String m_No;
	private Date o_Date;
	private String o_Name;
	private String o_Phone;
	private String o_Email;
	private String r_Name;
	private String r_Phone;
	private String r_Address;
	private String r_Post;
	private String o_TotalPrice;
	private String o_PayWay;
	private int o_Delivery;
	public Payment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Payment(int o_No, String m_No, Date o_Date, String o_Name, String o_Phone, String o_Email, String r_Name,
			String r_Phone, String r_Address, String r_Post, String o_TotalPrice, String o_PayWay, int o_Delivery) {
		super();
		this.o_No = o_No;
		this.m_No = m_No;
		this.o_Date = o_Date;
		this.o_Name = o_Name;
		this.o_Phone = o_Phone;
		this.o_Email = o_Email;
		this.r_Name = r_Name;
		this.r_Phone = r_Phone;
		this.r_Address = r_Address;
		this.r_Post = r_Post;
		this.o_TotalPrice = o_TotalPrice;
		this.o_PayWay = o_PayWay;
		this.o_Delivery = o_Delivery;
	}
	public int getO_No() {
		return o_No;
	}
	public void setO_No(int o_No) {
		this.o_No = o_No;
	}
	public String getM_No() {
		return m_No;
	}
	public void setM_No(String m_No) {
		this.m_No = m_No;
	}
	public Date getO_Date() {
		return o_Date;
	}
	public void setO_Date(Date o_Date) {
		this.o_Date = o_Date;
	}
	public String getO_Name() {
		return o_Name;
	}
	public void setO_Name(String o_Name) {
		this.o_Name = o_Name;
	}
	public String getO_Phone() {
		return o_Phone;
	}
	public void setO_Phone(String o_Phone) {
		this.o_Phone = o_Phone;
	}
	public String getO_Email() {
		return o_Email;
	}
	public void setO_Email(String o_Email) {
		this.o_Email = o_Email;
	}
	public String getR_Name() {
		return r_Name;
	}
	public void setR_Name(String r_Name) {
		this.r_Name = r_Name;
	}
	public String getR_Phone() {
		return r_Phone;
	}
	public void setR_Phone(String r_Phone) {
		this.r_Phone = r_Phone;
	}
	public String getR_Address() {
		return r_Address;
	}
	public void setR_Address(String r_Address) {
		this.r_Address = r_Address;
	}
	public String getR_Post() {
		return r_Post;
	}
	public void setR_Post(String r_Post) {
		this.r_Post = r_Post;
	}
	public String getO_TotalPrice() {
		return o_TotalPrice;
	}
	public void setO_TotalPrice(String o_TotalPrice) {
		this.o_TotalPrice = o_TotalPrice;
	}
	public String getO_PayWay() {
		return o_PayWay;
	}
	public void setO_PayWay(String o_PayWay) {
		this.o_PayWay = o_PayWay;
	}
	public int getO_Delivery() {
		return o_Delivery;
	}
	public void setO_Delivery(int o_Delivery) {
		this.o_Delivery = o_Delivery;
	}
	@Override
	public String toString() {
		return "Payment [o_No=" + o_No + ", m_No=" + m_No + ", o_Date=" + o_Date + ", o_Name=" + o_Name + ", o_Phone="
				+ o_Phone + ", o_Email=" + o_Email + ", r_Name=" + r_Name + ", r_Phone=" + r_Phone + ", r_Address="
				+ r_Address + ", r_Post=" + r_Post + ", o_TotalPrice=" + o_TotalPrice + ", o_PayWay=" + o_PayWay
				+ ", o_Delivery=" + o_Delivery + "]";
	}
	
	
	
	
}
