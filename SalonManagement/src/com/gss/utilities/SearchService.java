package com.gss.utilities;

import java.util.List;

import com.gss.model.Service;

public class SearchService {
	
	public Service search(int serviceID, List<Service> serviceList){
		
		for(int intCtr = 0; intCtr < serviceList.size(); intCtr++){
			Service serv = serviceList.get(intCtr);
			
			if(serviceID == serv.getIntServiceID())
				return serv;
		}
		System.out.println("NO ID");
		return null;
		
	}

}
