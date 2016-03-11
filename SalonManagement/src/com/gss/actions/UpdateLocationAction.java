package com.gss.actions;

import com.gss.model.Location;
import com.gss.service.LocationService;
import com.gss.service.LocationServiceImpl;

public class UpdateLocationAction {
	
	private int intLocationID;
	private String strLocationName;
	private double dblLocationPrice;
	
	public String execute(){
		
		LocationService service = new LocationServiceImpl();
		Location location = new Location(this.intLocationID, this.strLocationName, this.dblLocationPrice, 1);
		
		if(service.updateLocation(location) == true)
			return "success";
		else
			return "failed";
		
	}

	public int getIntLocationID() {
		return intLocationID;
	}

	public void setIntLocationID(int intLocationID) {
		this.intLocationID = intLocationID;
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
