package com.gss.model;

public class Product {
	
	private int intProductID;
	private String strProductName;
	private String strProductCategory;
	private String strProductDesc;
	private int intProductQuantity;
	private byte[] productPhoto;
	private double dblProductPrice;
	private String strPhotoPath;
	
	public Product(int intProductID, String strProductName, String strProductCategory, String strProductDesc, int intProductQuantity, byte[] productPhoto, double dblProductPrice, String strPhotoPath){
		
		this.setIntProductID(intProductID);
		this.strProductName = strProductName;
		this.strProductCategory = strProductCategory;
		this.strProductDesc = strProductDesc;
		this.intProductQuantity = intProductQuantity;
		this.productPhoto = productPhoto;
		this.dblProductPrice = dblProductPrice;
		this.strPhotoPath = strPhotoPath;
	}

	public int getIntProductID() {
		return intProductID;
	}
	
	public void setIntProductID(int intProductID) {
		this.intProductID = intProductID;
	}

	public String getStrProductName() {
		return strProductName;
	}

	public void setStrProductName(String strProductName) {
		this.strProductName = strProductName;
	}

	public String getStrProductCategory() {
		return strProductCategory;
	}

	public void setStrProductCategory(String strProductCategory) {
		this.strProductCategory = strProductCategory;
	}

	public String getStrProductDesc() {
		return strProductDesc;
	}

	public void setStrProductDesc(String strProductDesc) {
		this.strProductDesc = strProductDesc;
	}

	public int getIntProductQuantity() {
		return intProductQuantity;
	}

	public void setIntProductQuantity(int intProductQuantity) {
		this.intProductQuantity = intProductQuantity;
	}

	public byte[] getProductPhoto() {
		return productPhoto;
	}

	public void setProductPhoto(byte[] productPhoto) {
		this.productPhoto = productPhoto;
	}

	public double getDblProductPrice() {
		return dblProductPrice;
	}

	public void setDblProductPrice(double dblProductPrice) {
		this.dblProductPrice = dblProductPrice;
	}

	public String getStrPhotoPath() {
		return strPhotoPath;
	}

	public void setStrPhotoPath(String strPhotoPath) {
		this.strPhotoPath = strPhotoPath;
	}
}
