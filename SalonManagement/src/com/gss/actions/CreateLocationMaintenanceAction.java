package com.gss.actions;

import com.gss.model.Location;
import com.gss.service.LocationService;
import com.gss.service.LocationServiceImpl;

public class CreateLocationMaintenanceAction {
	
	private String strLocationName;
	private double dblLocationPrice;
	
	public String execute(){
		
		LocationService service = new LocationServiceImpl();
		Location location = new Location(1, this.strLocationName, this.dblLocationPrice, 1);
		
		if(service.createLocation(location) == true)
			return "success";
		else
			return "failed";
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

}
