package com.gss.model;

import java.util.List;

public class Promo {
	
	private int intPromoID;
	private String strPromoName;
	private String strPromoDescription;
	private double dblPromoPrice;
	private int intMaxHeadCount;
	private List<ServicePackage> serviceList;
	private List<ProductPackage> productList;
	private String strPromoAvailability;
	
	public Promo(int intPromoID, String strPromoName, String strPromoDescription, double dblPromoPrice, int intMaxHeadCount, List<ServicePackage> serviceList, List<ProductPackage> productList, String strPromoAvailability){
		
		this.intPromoID = intPromoID;
		this.strPromoName = strPromoName;
		this.strPromoDescription = strPromoDescription;
		this.dblPromoPrice = dblPromoPrice;
		this.intMaxHeadCount = intMaxHeadCount;
		this.serviceList = serviceList;
		this.productList = productList;
		this.setStrPromoAvailability(strPromoAvailability);
	}

	public int getIntPromoID() {
		return intPromoID;
	}

	public void setIntPromoID(int intPromoID) {
		this.intPromoID = intPromoID;
	}

	public String getStrPromoName() {
		return strPromoName;
	}

	public void setStrPromoName(String strPromoName) {
		this.strPromoName = strPromoName;
	}

	public String getStrPromoDescription() {
		return strPromoDescription;
	}

	public void setStrPromoDescription(String strPromoDescription) {
		this.strPromoDescription = strPromoDescription;
	}

	public double getDblPromoPrice() {
		return dblPromoPrice;
	}

	public void setDblPromoPrice(double dblPromoPrice) {
		this.dblPromoPrice = dblPromoPrice;
	}

	public List<ServicePackage> getServiceList() {
		return serviceList;
	}

	public void setServiceList(List<ServicePackage> serviceList) {
		this.serviceList = serviceList;
	}

	public List<ProductPackage> getProductList() {
		return productList;
	}

	public void setProductList(List<ProductPackage> productList) {
		this.productList = productList;
	}

	public String getStrPromoAvailability() {
		return strPromoAvailability;
	}

	public void setStrPromoAvailability(String strPromoAvailability) {
		this.strPromoAvailability = strPromoAvailability;
	}

	public int getIntMaxHeadCount() {
		return intMaxHeadCount;
	}

	public void setIntMaxHeadCount(int intMaxHeadCount) {
		this.intMaxHeadCount = intMaxHeadCount;
	}


}
