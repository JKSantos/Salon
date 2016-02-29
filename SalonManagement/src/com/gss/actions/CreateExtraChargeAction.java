package com.gss.actions;

import com.gss.model.ExtraCharge;
import com.gss.service.ExtraChargeService;
import com.gss.service.ExtraChargeServiceImpl;

public class CreateExtraChargeAction {
	
	private String strECName;
	private String strECDetails;
	
	public String execute(){
		
		ExtraChargeService service = new ExtraChargeServiceImpl();
		
		ExtraCharge extra = new ExtraCharge(1, strECName, strECDetails);
		
		if(service.createExtraCharge(extra) == true)
			return "success";
		else
			return "failed";
		
	}

	public String getStrECName() {
		return strECName;
	}

	public void setStrECName(String strECName) {
		this.strECName = strECName;
	}

	public String getStrECDetails() {
		return strECDetails;
	}

	public void setStrECDetails(String strECDetails) {
		this.strECDetails = strECDetails;
	}
	
	

}
