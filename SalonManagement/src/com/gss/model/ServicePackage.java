package com.gss.model;

public class ServicePackage {
	
	private int intServicePackageID;
	private Service service;
	private int intStatus;
	
	public ServicePackage(int intServicePackageID, Service service, int intStatus){
		
		this.setIntServicePackageID(intServicePackageID);
		this.service = service;
		this.intStatus = intStatus;
		
	}

	public Service getService() {
		return service;
	}

	public void setService(Service service) {
		this.service = service;
	}

	public int getIntStatus() {
		return intStatus;
	}

	public void setIntStatus(int intStatus) {
		this.intStatus = intStatus;
	}

	public int getIntServicePackageID() {
		return intServicePackageID;
	}

	public void setIntServicePackageID(int intServicePackageID) {
		this.intServicePackageID = intServicePackageID;
	}

}
