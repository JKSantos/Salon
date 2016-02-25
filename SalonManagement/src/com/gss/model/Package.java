package com.gss.model;

import java.util.List;

public class Package {
	
	private int intPackageID;
	private String strPackageName;
	private String strPackageDesc;
	private int intPackageType;
	private int intMaxHeadCount;
	private String strPackageAvailability;
	private double dblPackagePrice;
	private List<ServicePackage> serviceList;
	private List<ProductPackage> productList;
					//int			string					string					int					int					string							double					list							list
	public Package(int intPackageID, String strPackageName, String strPackageDesc, int intPackageType, int intMaxHeadCount, String strPackageAvailability, double dblPackagePrice, List<ServicePackage> serviceList, List<ProductPackage> productList){
		
		this.intPackageID = intPackageID;
		this.strPackageName = strPackageName;
		this.strPackageDesc = strPackageDesc;
		this.intPackageType = intPackageType;
		this.setIntMaxHeadCount(intMaxHeadCount);
		this.setStrPackageAvailability(strPackageAvailability);
		this.dblPackagePrice = dblPackagePrice;
		this.serviceList = serviceList;
		this.productList = productList;
	}

	public int getIntPackageID() {
		return intPackageID;
	}

	public void setIntPackageID(int intPackageID) {
		this.intPackageID = intPackageID;
	}

	public String getStrPackageName() {
		return strPackageName;
	}

	public void setStrPackageName(String strPackageName) {
		this.strPackageName = strPackageName;
	}

	public String getStrPackageDesc() {
		return strPackageDesc;
	}

	public void setStrPackageDesc(String strPackageDesc) {
		this.strPackageDesc = strPackageDesc;
	}

	public int getIntPackageType() {
		return intPackageType;
	}

	public void setIntPackageType(int intPackageType) {
		this.intPackageType = intPackageType;
	}

	public double getDblPackagePrice() {
		return dblPackagePrice;
	}

	public void setDblPackagePrice(double dblPackagePrice) {
		this.dblPackagePrice = dblPackagePrice;
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

	public String getStrPackageAvailability() {
		return strPackageAvailability;
	}

	public void setStrPackageAvailability(String strPackageAvailability) {
		this.strPackageAvailability = strPackageAvailability;
	}

	public int getIntMaxHeadCount() {
		return intMaxHeadCount;
	}

	public void setIntMaxHeadCount(int intMaxHeadCount) {
		this.intMaxHeadCount = intMaxHeadCount;
	}

}
