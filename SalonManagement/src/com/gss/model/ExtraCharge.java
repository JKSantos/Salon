package com.gss.model;

public class ExtraCharge {
	
	private int intECID;
	private String strECName;
	private String strECDetails;
	
	public ExtraCharge(int intECID, String strECName, String strECDetails){
		this.intECID = intECID;
		this.strECName = strECName;
		this.strECDetails = strECDetails;
	}

	public int getIntECID() {
		return intECID;
	}

	public void setIntECID(int intECID) {
		this.intECID = intECID;
	}

	public String getStrECName() {
		return strECName;
	}

	public void setStrECName(String strECName) {
		this.strECName = strECName;
	}

	public String getStrECDetails() {
		return strECDetails;
	}

	public void setStrECDetails(String strECDetails) {
		this.strECDetails = strECDetails;
	}

}
