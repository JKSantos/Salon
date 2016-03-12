package com.gss.actions;

import com.gss.service.PackageService;
import com.gss.service.PackageServiceImpl;

public class DeactivatePackageAction {
	
	private int intPackageID;
	
	public String execute(){
		
		PackageService service = new PackageServiceImpl();
		
		if(service.deactivatePackage(intPackageID))
			return "success";
		else
			return "failed";
	}

	public int getIntPackageID() {
		return intPackageID;
	}

	public void setIntPackageID(int intPackageID) {
		this.intPackageID = intPackageID;
	}

}
