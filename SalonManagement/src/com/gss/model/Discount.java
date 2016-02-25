package com.gss.model;

public class Discount {
	
	private int intDiscountID;
	private String strDiscountName;
	private String strDiscountDesc;
	private int intDiscountType;
	private double dblDiscountAmount;
	
	public Discount(int intDiscountID, String strDiscountName, String strDiscountDesc, int intDiscountType, double dblDiscountAmount){
		this.setIntDiscountID(intDiscountID);
		this.setStrDiscountName(strDiscountName);
		this.setStrDiscountDesc(strDiscountDesc);
		this.setIntDiscountType(intDiscountType);
		this.setDblDiscountAmount(dblDiscountAmount);
	}

	public int getIntDiscountID() {
		return intDiscountID;
	}

	public void setIntDiscountID(int intDiscountID) {
		this.intDiscountID = intDiscountID;
	}

	public String getStrDiscountName() {
		return strDiscountName;
	}

	public void setStrDiscountName(String strDiscountName) {
		this.strDiscountName = strDiscountName;
	}

	public String getStrDiscountDesc() {
		return strDiscountDesc;
	}

	public void setStrDiscountDesc(String strDiscountDesc) {
		this.strDiscountDesc = strDiscountDesc;
	}

	public int getIntDiscountType() {
		return intDiscountType;
	}

	public void setIntDiscountType(int intDiscountType) {
		this.intDiscountType = intDiscountType;
	}

	public double getDblDiscountAmount() {
		return dblDiscountAmount;
	}

	public void setDblDiscountAmount(double dblDiscountAmount) {
		this.dblDiscountAmount = dblDiscountAmount;
	}

}
