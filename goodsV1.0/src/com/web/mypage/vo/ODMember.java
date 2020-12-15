package com.web.mypage.vo;

import java.util.Date;

public class ODMember {

	private int oNo;
	private String cfileName;
	private String pName;
	private String cColor;
	private int tPrice;
	private int oQuan;
	private String oName;
	private Date oDate;
	private int cNo;
	private String galleryStatus;
	
	public ODMember() {
		// TODO Auto-generated constructor stub
	}

	public ODMember(int oNo, String cfileName, String pName, String cColor, int tPrice, int oQuan,
			String oName, Date oDate, int cNo, String galleryStatus) {
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
		this.galleryStatus = galleryStatus;
	}

	/**
	 * @return the oNo
	 */
	public int getoNo() {
		return oNo;
	}

	/**
	 * @param oNo the oNo to set
	 */
	public void setoNo(int oNo) {
		this.oNo = oNo;
	}

	/**
	 * @return the cfileName
	 */
	public String getCfileName() {
		return cfileName;
	}

	/**
	 * @param cfileName the cfileName to set
	 */
	public void setCfileName(String cfileName) {
		this.cfileName = cfileName;
	}

	/**
	 * @return the pName
	 */
	public String getpName() {
		return pName;
	}

	/**
	 * @param pName the pName to set
	 */
	public void setpName(String pName) {
		this.pName = pName;
	}

	/**
	 * @return the cColor
	 */
	public String getcColor() {
		return cColor;
	}

	/**
	 * @param cColor the cColor to set
	 */
	public void setcColor(String cColor) {
		this.cColor = cColor;
	}

	/**
	 * @return the tPrice
	 */
	public int gettPrice() {
		return tPrice;
	}

	/**
	 * @param tPrice the tPrice to set
	 */
	public void settPrice(int tPrice) {
		this.tPrice = tPrice;
	}

	/**
	 * @return the oQuan
	 */
	public int getoQuan() {
		return oQuan;
	}

	/**
	 * @param oQuan the oQuan to set
	 */
	public void setoQuan(int oQuan) {
		this.oQuan = oQuan;
	}

	/**
	 * @return the oName
	 */
	public String getoName() {
		return oName;
	}

	/**
	 * @param oName the oName to set
	 */
	public void setoName(String oName) {
		this.oName = oName;
	}

	/**
	 * @return the oDate
	 */
	public Date getoDate() {
		return oDate;
	}

	/**
	 * @param oDate the oDate to set
	 */
	public void setoDate(Date oDate) {
		this.oDate = oDate;
	}

	/**
	 * @return the cNo
	 */
	public int getcNo() {
		return cNo;
	}

	/**
	 * @param cNo the cNo to set
	 */
	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	/**
	 * @return the galleryStatus
	 */
	public String getGalleryStatus() {
		return galleryStatus;
	}

	/**
	 * @param galleryStatus the galleryStatus to set
	 */
	public void setGalleryStatus(String galleryStatus) {
		this.galleryStatus = galleryStatus;
	}

	@Override
	public String toString() {
		return "OrderDeliveryMember [oNo=" + oNo + ", cfileName=" + cfileName + ", pName=" + pName + ", cColor="
				+ cColor + ", tPrice=" + tPrice + ", oQuan=" + oQuan + ", oName=" + oName + ", oDate=" + oDate
				+ ", cNo=" + cNo + ", galleryStatus=" + galleryStatus + "]";
	}

	

	
	
}