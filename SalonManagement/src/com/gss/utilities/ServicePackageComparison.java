package com.gss.utilities;

import java.util.List;

import com.gss.model.ServicePackage;

public class ServicePackageComparison {
	
	public String compare(ServicePackage servPack, List<ServicePackage> serviceList)throws NullPointerException{
		
		for(int intCtr = 0; intCtr < serviceList.size(); intCtr++){
			
			ServicePackage pack = serviceList.get(intCtr);
				
			if(servPack.getIntServicePackageID() == pack.getIntServicePackageID() && servPack.getService().getIntServiceID() == pack.getService().getIntServiceID() && servPack.getIntStatus() == pack.getIntStatus()){
				System.out.println(">>same " + servPack.getIntServicePackageID() + " " + pack.getIntServicePackageID());
				return "same";
			}
			else if(servPack.getIntServicePackageID() == pack.getIntServicePackageID() && servPack.getService().getIntServiceID() != pack.getService().getIntServiceID() || servPack.getIntServicePackageID() == pack.getIntServicePackageID() && servPack.getIntStatus() != pack.getIntStatus()){
				System.out.println(">>update " + servPack.getIntServicePackageID() + " " + pack.getIntServicePackageID());
				return "update";
			}
			else if(intCtr == (serviceList.size() - 1)){
				System.out.println(">>new " + servPack.getIntServicePackageID() + " " + pack.getIntServicePackageID());
				return "new";
			}
			
		}
		
		return null;
		
	}

}
