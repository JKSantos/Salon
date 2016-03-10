package com.gss.model;

public class Location {
	
	private int intLocationID;
	private String strLocationName;
	private double dblLocationPrice;
	private int intLocationStatus;
	
	public Location(int intLocationID, String strLocationName, double dblLocationPrice, int intLocationStatus){
		
		this.intLocationID = intLocationID;
		this.strLocationName = strLocationName;
		this.dblLocationPrice = dblLocationPrice;
		this.intLocationStatus = intLocationStatus;
	}

	public int getIntLocationID() {
		return intLocationID;
	}

	public void setIntLocationID(int intLocationID) {
		this.intLocationID = intLocationID;
	}

	public String getStrLocationName() {
		return strLocationName;
	}

	public void setStrLocationName(String strLocationName) {
		this.strLocationName = strLocationName;
	}

	public double getDblLocationPrice() {
		return dblLocationPrice;
	}

	public void setDblLocationPrice(double dblLocationPrice) {
		this.dblLocationPrice = dblLocationPrice;
	}

	public int getIntLocationStatus() {
		return intLocationStatus;
	}

	public void setIntLocationStatus(int intLocationStatus) {
		this.intLocationStatus = intLocationStatus;
	}

}
