package com.gss.actions;

import java.util.List;

import com.gss.model.Package;
import com.gss.service.PackageService;
import com.gss.service.PackageServiceImpl;

public class PackageMaintenance {
	
	private List<Package> packageList;
	
	public String execute(){
		
		PackageService service = new PackageServiceImpl();
		this.packageList = service.getAllPackage();
		
		return "success";
	}

	public List<Package> getPackageList() {
		return packageList;
	}

	public void setPackageList(List<Package> packageList) {
		this.packageList = packageList;
	}

}
