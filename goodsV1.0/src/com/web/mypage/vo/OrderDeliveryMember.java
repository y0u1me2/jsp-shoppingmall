package com.web.mypage.vo;

public class OrderDeliveryMember {

	private int c_No;
	private int o_No;
	private int m_No;
	
	public OrderDeliveryMember() {
		// TODO Auto-generated constructor stub
	}

	public OrderDeliveryMember(int c_No, int o_No, int m_No) {
		super();
		this.c_No = c_No;
		this.o_No = o_No;
		this.m_No = m_No;
	}

	/**
	 * @return the c_No
	 */
	public int getC_No() {
		return c_No;
	}

	/**
	 * @param c_No the c_No to set
	 */
	public void setC_No(int c_No) {
		this.c_No = c_No;
	}

	/**
	 * @return the o_No
	 */
	public int getO_No() {
		return o_No;
	}

	/**
	 * @param o_No the o_No to set
	 */
	public void setO_No(int o_No) {
		this.o_No = o_No;
	}

	/**
	 * @return the m_No
	 */
	public int getM_No() {
		return m_No;
	}

	/**
	 * @param m_No the m_No to set
	 */
	public void setM_No(int m_No) {
		this.m_No = m_No;
	}

	@Override
	public String toString() {
		return "OrderDeliveryVo [c_No=" + c_No + ", o_No=" + o_No + ", m_No=" + m_No + "]";
	}
	
}
