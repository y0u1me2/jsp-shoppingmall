package com.web.member.model.vo;

import java.util.Date;

public class Member {
	
	private int m_No;
	private String m_Email;
	private String m_Password;
	private String m_NickName;
	private String m_Name;
	private String m_Post;
	private String m_Address;
	private String m_Phone;
	private String m_EmailCheck;
	private String m_Status;
	private Date m_Enroll;
	
	public Member() {		
	}

	public Member(String m_Email, String m_Password, String m_Name, String m_NickName) {
		super();
		this.m_Email = m_Email;
		this.m_NickName = m_NickName;
		this.m_Name = m_Name;
		this.m_Password = m_Password;
	}
	
	public Member(String m_Email, String m_Password, String m_Name, String m_NickName, String m_EmailCheck) {
		super();
		this.m_Email = m_Email;
		this.m_NickName = m_NickName;
		this.m_Name = m_Name;
		this.m_Password = m_Password;
		this.m_EmailCheck=m_EmailCheck;
	}
	
	public void setM_No(int m_No) {
		this.m_No = m_No;
	}

	public int getM_No() {
		return m_No;
	}
	public String getM_NickName() {
		return m_NickName;
	}

	public void setM_NickName(String m_NickName) {
		this.m_NickName = m_NickName;
	}

	public String getM_Name() {
		return m_Name;
	}

	public void setM_Name(String m_Name) {
		this.m_Name = m_Name;
	}

	public String getM_Password() {
		return m_Password;
	}

	public void setM_Password(String m_Password) {
		this.m_Password = m_Password;
	}

	public String getM_Address() {
		return m_Address;
	}

	public void setM_Address(String m_Address) {
		this.m_Address = m_Address;
	}

	public String getM_Post() {
		return m_Post;
	}

	public void setM_Post(String m_Post) {
		this.m_Post = m_Post;
	}

	public String getM_Phone() {
		return m_Phone;
	}

	public void setM_Phone(String m_Phone) {
		this.m_Phone = m_Phone;
	}

	public Date getM_Enroll() {
		return m_Enroll;
	}

	public void setM_Enroll(Date m_Enroll) {
		this.m_Enroll = m_Enroll;
	}

	public String getM_Email() {
		return m_Email;
	}

	public void setM_Email(String m_Email) {
		this.m_Email = m_Email;
	}	
	
	public String getM_EmailCheck() {
		return m_EmailCheck;
	}

	public void setM_EmailCheck(String m_EmailCheck) {
		this.m_EmailCheck = m_EmailCheck;
	}

	public String getM_Status() {
		return m_Status;
	}

	public void setM_Status(String m_Status) {
		this.m_Status = m_Status;
	}

	@Override
	public String toString() {
		return "Member [m_No=" + m_No + ", m_NickName=" + m_NickName + ", m_Name=" + m_Name + ", m_Password="
				+ m_Password + ", m_Address=" + m_Address + ", m_Post=" + m_Post + ", m_Phone=" + m_Phone
				+ ", m_Enroll=" + m_Enroll + ", m_Email=" + m_Email + "]";
	}
	
	
	
	
}
